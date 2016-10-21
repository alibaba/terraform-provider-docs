package alicloud

import (
	"fmt"
	"strings"

	"github.com/denverdino/aliyungo/ecs"
	"github.com/hashicorp/terraform/helper/schema"
)

func resourceAliyunDiskAttachment() *schema.Resource {
	return &schema.Resource{
		Create: resourceAliyunDiskAttachmentCreate,
		Read:   resourceAliyunDiskAttachmentRead,
		Delete: resourceAliyunDiskAttachmentDelete,

		Schema: map[string]*schema.Schema{
			"instance_id": &schema.Schema{
				Type:     schema.TypeString,
				Required: true,
				ForceNew: true,
			},
			"disk_id": &schema.Schema{
				Type:     schema.TypeString,
				Required: true,
				ForceNew: true,
			},

			"device_name": &schema.Schema{
				Type:     schema.TypeString,
				Optional: true,
				Computed: true,
				ForceNew: true,
			},
		},
	}
}

func resourceAliyunDiskAttachmentCreate(d *schema.ResourceData, meta interface{}) error {

	conn := meta.(*AliyunClient).ec2conn

	diskID := d.Get("disk_id").(string)
	instanceID := d.Get("instance_id").(string)

	deviceName := d.Get("device_name").(string)

	args := &ecs.AttachDiskArgs{
		InstanceId: instanceID,
		DiskId:     diskID,
		Device:     deviceName,
	}
	if err := conn.AttachDisk(args); err != nil {
		return err
	}

	d.SetId(diskID + ":" + instanceID)
	d.SetPartial("disk_id")
	d.SetPartial("instance_id")
	d.SetPartial("device_name")
	return nil
}

func resourceAliyunDiskAttachmentRead(d *schema.ResourceData, meta interface{}) error {

	_, _, err := getDisIDAndInstanceID(d, meta)
	if err != nil {
		return err
	}

	return nil
}

func resourceAliyunDiskAttachmentDelete(d *schema.ResourceData, meta interface{}) error {

	conn := meta.(*AliyunClient).ec2conn

	diskID, instanceID, err := getDisIDAndInstanceID(d, meta)
	if err != nil {
		return err
	}

	if err := conn.DetachDisk(instanceID, diskID); err != nil {
		return err
	}

	return nil
}

func getDisIDAndInstanceID(d *schema.ResourceData, meta interface{}) (string, string, error) {
	parts := strings.Split(d.Id(), ":")

	if len(parts) != 2 {
		return "", "", fmt.Errorf("invalid resource id")
	}
	return parts[0], parts[1], nil
}
