# Deploy Discourse on Kubernetes

## Production environment
The discourse production environent contains of
  - 1 Service                 ([prod/discourse-prod.yml](prod/discourse-prod.yml))
  - 1 Deployment              ([prod/discourse-prod.yml](prod/discourse-prod.yml))
  - 2 PersistentVolumeClaims  ([prod/discourse-prod-volumes.yml](prod/discourse-prod-volumes.yml))
  - 1 Secret                  (file not stored in this repository)
  
To deploy the files named basic scripts are provided.

### Prerequisites
#### Secret
Before the deployment itself can be applied the secret containing SMTP information has to exist.

For the deployment a SMTP server and a Domain Name are needed. The secret stores information about concerning SMTP.
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: discourse-prod-secret
type: Opaque
stringData:
  discourse_developer_emails: "<DEVELOPER_MAIL_1>,<DEVELOPER_MAIL_2>,..."
  discourse_smtp_address: "<SMTP_SERVER>"
  discourse_smtp_user_name: "<SMTP_USERNAME>"
  discourse_smtp_password: "<SMTP_PASSWORD>"
```

Currently AWS SES provides mailing for us. For the information log into the AWS Console, find `Simple Email Service` and under `Domains` check if there is an entry for the domain that the 
Discourse instance is referring to.

If this is the case click `SMTP Settings` on the left. Here you find SMTP server adress and port.

Now only username and passwort are needed to use the SES server. If there already has been an entry for the domain you are working with chances are, that there also is
an existing user. Best ask around your team.

When there is no user yet you can create one at `Create My SMTP Credentials --> Create --> Show User SMTP Credentials`.

These informations are not shown again, so be sure to have them in a safe place.

Lastly developer mails are mails of your choice used for signin in as an admin after startup.
You may now fill in the gaps in the YAML above, save it under `<name_of_your_choice>.yml` and apply it to Kubernetes via 
```
$ kubectl apply -f <name_of_your_choice>.yml
```

#### Image
