#Flatiron Scheduler

##Deploying the Day's Schedule

The gem deploys the schedule from the `future` branch. To deploy, run `flatiron_scheduler WEEK_NUMBER DAY_NUMBER`. For example, `flatiron_scheduler 5 4` will update the schedule with `week-5/day-4.md` from the `future` branch.

## Setup

The first time you run your gem, it will prompt you for the path of the schedule repo on your local machine. To edit the path, run `flatiron_scheduler setup SCHEDULE_PATH`.
