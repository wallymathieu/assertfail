---
layout: post
title: Set up PR Agent on Azure DevOps with a service principal
date: 2026-08-22T08:19:30+00:00
tags: LLM
---

I tried out to follow the PR Agent [Azure installation](https://github.com/The-PR-Agent/pr-agent/blob/main/docs/docs/installation/azure.md). I wanted to use an application identity rather than an individual user's PAT, so I after a few sessions of edit, Claude, ChatGPT and observe the results we got a setup that deviated slightly from the documentation. This example uses a Microsoft Entra service principal with a client secret, not managed identity. Avoiding an individual user's PAT does not make the setup managed identity:


```diff
 stages:
 - stage: pr_agent
   displayName: 'PR Agent Stage'
+  condition: eq(variables['Build.Reason'], 'PullRequest')
+  dependsOn: []
   jobs:
   - job: pr_agent_job
     displayName: 'PR Agent Job'
     pool:
      vmImage: 'ubuntu-latest'
     container:
       image: pragent/pr-agent:latest
       options: --entrypoint ""
     variables:
      - group: pr_agent
     steps:
     - script: |
         ...unchanged...
       env:
-        azure_devops__pat: $(azure_devops_pat)
-        openai__key: $(OPENAI_KEY)
+        openai__key: $(vg-pr-agent-OPENAI_KEY)
+        AZURE_CLIENT_ID: $(vg-pr-agent-AZURE_CLIENT_ID)
+        AZURE_CLIENT_SECRET: $(vg-pr-agent-AZURE_CLIENT_SECRET)
+        AZURE_TENANT_ID: $(vg-pr-agent-AZURE_TENANT_ID)
       displayName: 'Run PR-Agent'
```

Note the addition to only trigger on pull request and avoid depending on other stages in the pipeline.

Create an app registration in Microsoft Entra ID and a client secret for it. The app registration defines the application; its service principal is the identity shown under Enterprise Applications in the tenant. Add that service principal to the Azure DevOps organization and grant it the permissions PR Agent needs for the relevant projects and repositories.

Store the client secret as a protected pipeline secret in the `pr_agent` variable group, monitor its expiry, and rotate it before it expires. Application-based authentication still requires credential management.