# Installation

To tweet your own Working Group's document changes, follow these steps:

## 1. Fork this Repo

This service isn't provided in a central repo because we don't want to have your credentials. Create a copy by forking it (so that you can pull updates later).

## 2. Create a Twitter Application

This is the most onerous (and frustrating) step, because:

* Twitter has a lot of bureaucracy around creating developer accounts, and
* Twitter keeps on changing their authentication mechanisms, and making them more complex.

As of this writing, the steps involve are:

1. Log into Twitter using the account you wish to tweet from.
2. Go to [developer.twitter.com](https://developer.twitter.com/)
3. Click 'apply' (at the top right) and go through the steps to obtain a developer account. This may take a few days, and require followup e-mails with Twitter.
4. Once your account is approved, go back to the developer site.
5. Create a new project, named for your Working Group. In that project, create a new app.
6. Copy the `API Key and Secret`.
7. Change the `App permissions` to `Read and Write`.
8. Click on the `Keys and tokens` tab and generate a new Access Token and Secret`; keep copies.

See also [these currently-outdated docs](https://python-twitter.readthedocs.io/en/latest/getting_started.html).


## 3. Set Repository Secrets

The following repository secrets need to be created in the GitHub repository's `Settings` (under `Secrets`):

* `WORKING_GROUP` - the short identifier for the WG, e.g., `httpbis`, `tls`. Should be lowercase.
* `TWITTER_CONSUMER_KEY` - the API Key
* `TWITTER_CONSUMER_SECRET` - the API Secret
* `TWITTER_TOKEN_KEY` - the Access Token
* `TWITTER_TOKEN_SECRET` - the Access Secret


## 4. Randomise the Cron Job

Go into [`.github/workflows/run.yml`](.github/workflows/run.yml) and change this line:

~~~ crontab
    - cron: "15 */4 * * *"
~~~

... to randomise the minute that the job runs at, so that the datatracker API isn't overwhelmed.


## 5. Configure Github Actions

1. If they aren't already, enable Actions under `Settings` -> `Actions`.
2. On the same page, make sure that `Workflow permissions` is set to `Read and write permissions` (so that `LAST_SEEN` can be saved to the repo).
3. Go to the `Actions` top-level tab and click `I understand my workflows, go ahead and enable them`.


## 6. Update

Once in a while, you should update your copy of the repo, by pulling changes from upstream.

The easiest way to do this is to go to the GitHub home page of your fork of the repo, click 'Fetch upstream' near the top right, and confirm with 'Fetch and merge'.
