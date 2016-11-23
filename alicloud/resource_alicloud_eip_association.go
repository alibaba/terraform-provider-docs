package alicloud

import (
	"fmt"
	"strings"

	"github.com/hashicorp/terraform/helper/schema"
)

func resourceAliyunEipAssociation() *schema.Resource {
	return &schema.Resource{
		Create: resourceAliyunEipAssociationCreate,
		Read:   resourceAliyunEipAssociationRead,
		Delete: resourceAliyunEipAssociationDelete,

		Schema: map[string]*schema.Schema{
			"allocation_id": &schema.Schema{
				Type:     schema.TypeString,
				Optional: true,
				Computed: true,
				ForceNew: true,
			},

			"instance_id": &schema.Schema{
				Type:     schema.TypeString,
				Optional: true,
				Computed: true,
				ForceNew: true,
			},
		},
	}
}

func resourceAliyunEipAssociationCreate(d *schema.ResourceData, meta interface{}) error {

	conn := meta.(*AliyunClient).ecsconn

	allocationId := d.Get("allocation_id").(string)
	instanceId := d.Get("instance_id").(string)

	if err := conn.AssociateEipAddress(allocationId, instanceId); err != nil {
		return err
	}

	d.SetId(allocationId + ":" + instanceId)

	return nil
}

func resourceAliyunEipAssociationRead(d *schema.ResourceData, meta interface{}) error {
	client := meta.(*AliyunClient)

	allocationId, instanceId, err := getAllocationIdAndInstanceId(d, meta)
	if err != nil {
		return err
	}

	eip, err := client.DescribeEipAddress(allocationId)
	if err != nil {
		if notFoundError(err) {
			d.SetId("")
			return nil
		}
		return err
	}

	if eip.InstanceId != instanceId {
		d.SetId("")
		return nil
	}

	d.Set("instance_id", eip.InstanceId)
	d.Set("allocation_id", allocationId)
	return nil
}

func resourceAliyunEipAssociationDelete(d *schema.ResourceData, meta interface{}) error {

	conn := meta.(*AliyunClient).ecsconn

	allocationId, instanceId, err := getAllocationIdAndInstanceId(d, meta)
	if err != nil {
		return err
	}

	if err := conn.UnassociateEipAddress(allocationId, instanceId); err != nil {
		return err
	}

	return nil
}

func getAllocationIdAndInstanceId(d *schema.ResourceData, meta interface{}) (string, string, error) {
	parts := strings.Split(d.Id(), ":")

	if len(parts) != 2 {
		return "", "", fmt.Errorf("invalid resource id")
	}
	return parts[0], parts[1], nil
}
