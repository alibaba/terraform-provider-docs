resource "alicloud_ess_schedule" "schedule" {
  scheduled_action    = "${alicloud_ess_scaling_rule.rule.ari}"
  launch_time         = "2017-04-29T07:30Z"
  scheduled_task_name = "sg-schedule"
}
