# Simple Gantt chart plotting function. 
``gantt_chart(slots, labels, active_color, passive_color)``
## Arguments:
* ``slots``: Matrix with rows per activity. 
  * Columns should correspond to alternating begin and end times (absolute) of an activity.
  * Rows should be padded to the right with zeros if number of slots is unequal for different activities.
* ``labels``: Column containing activity labels.
* ``active_color``: Color of active slots of an activity.
* ``passive_color``: Color of passive slots of an activity.

## Returns:
* ``fig``: Figure handle
* ``ax``: Axis handle
