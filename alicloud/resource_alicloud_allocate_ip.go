package alicloud

import "github.com/hashicorp/terraform/helper/schema"

func resourceAliyunAllocateIp() *schema.Resource {
	return &schema.Resource{
		Create: resourceAliyunAllocate,

		Schema: map[string]*schema.Schema{
			"instance_id": &schema.Schema{
				Type:     schema.TypeString,
				Required: true,
				ForceNew: true,
			},
		},
	}
}

func resourceAliyunAllocate(d *schema.ResourceData, meta interface{}) error {

	conn := meta.(*AliyunClient).ec2conn

	instanceId := d.Get("instance_id").(string)

	ipAddress, err := conn.AllocatePublicIpAddress(instanceId)

	if err != nil {
		return err
	}

	d.SetId(ipAddress)
	d.Set("ipAddress", ipAddress)

	return nil
}
