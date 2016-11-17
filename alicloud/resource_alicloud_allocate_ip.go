package alicloud

import "github.com/hashicorp/terraform/helper/schema"

func resourceAliyunAllocateIp() *schema.Resource {
	return &schema.Resource{
		Create: resourceAliyunAllocate,
		Read:   resourceAliyunAllocateRead,
		Update: resourceAliyunAllocateUpdate,
		Delete: resourceAliyunAllocateDelete,

		Schema: map[string]*schema.Schema{
			"instance_id": &schema.Schema{
				Type:     schema.TypeString,
				Optional: true,
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

func resourceAliyunAllocateRead(d *schema.ResourceData, meta interface{}) error {
	return nil
}

func resourceAliyunAllocateUpdate(d *schema.ResourceData, meta interface{}) error {
	return nil
}

func resourceAliyunAllocateDelete(d *schema.ResourceData, meta interface{}) error {
	return nil
}
