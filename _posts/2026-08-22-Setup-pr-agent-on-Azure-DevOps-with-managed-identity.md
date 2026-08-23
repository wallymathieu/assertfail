---
layout: post
title: Setup pr agent on Azure DevOps with managed identity
date: 2026-08-22T08:19:30+00:00
tags: LLM
---

I tried out to follow the PR Agent [Azure installation](https://github.com/The-PR-Agent/pr-agent/blob/main/docs/docs/installation/azure.md). Normally you would use managed identity in order to avoid running things in user account, so I after a few sessions of edit, Claude, ChatGPT and observe the results we got a setup that deviated slightly from the documentation:


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

You have to setup an Enterprise Application, create a secret and add that Enterprise Application account to the Azure DevOps organization with contributor access.