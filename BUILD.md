# Build image with Google Cloud Build

- Configure env.mk
- Authenticate to Google account
- Run build

```console
$ make gbuild
Created [https://cloudbuild.googleapis.com/v1/projects/project-id/builds/e592095d-d2a2-4f07-a8d6-9c300cd61c1e].
Logs are available at [https://console.cloud.google.com/gcr/builds/....].
ID                                    CREATE_TIME                DURATION  SOURCE  IMAGES  STATUS
e123095d-d2a2-4f07-a8d6-9c300cd61c1e  2019-09-27T06:57:45+00:00  -         -       -       QUEUED
```

- Check build logs

```console
$ gcloud builds log e123095d-d2a2-4f07-a8d6-9c300cd61c1e --stream
```
