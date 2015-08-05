#Flatiron Scheduler

## Install and Setup

_To install the gem and set up your first schedule, follow the instructions below:_

1. Run `gem install flatiron_scheduler` to install.
2. To set up a new schedule, run `flatiron_scheduler new SCHEDULE_NAME CLONE_URL`. For example, `flatiron_scheduler new test_schedule git@github.com:learn-co-curriculum/web-0415.git`. The `CLONE_URL` should be the SSH URL of last semester's schedule repository.
3. Manually create a new GitHub repository for your new schedule.
4. Run `pwd` to find your local `SCHEDULE_PATH`. Run `flatiron_scheduler setup SCHEDULE_PATH`.

## Deploying the Day's Schedule

The gem deploys the schedule from the `future` branch. To deploy, run `flatiron_scheduler WEEK_NUMBER DAY_NUMBER`. For example, `flatiron_scheduler 5 4` will update the schedule with `week-5/day-4.md` from the `future` branch.

## Rollback

`flatiron_scheduler rollback` rolls back your latest commit. __Uses `git reset --hard`__.

## Template

Run `flatiron_scheduler template FILE_NAME` to generate a blank day file.

## Setup

The first time you run your gem, it will prompt you for the path of the schedule repo on your local machine. To edit the path of your schedule, run `flatiron_scheduler setup SCHEDULE_PATH`.

## New Schedule

To set up a new schedule, run `flatiron_scheduler new SCHEDULE_NAME CLONE_URL`. For example, `flatiron_scheduler new test_schedule git@github.com:learn-co-curriculum/web-0415.git`.
