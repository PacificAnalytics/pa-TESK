helm uninstall tesk-release
helm upgrade --install tesk-release ..\charts\tesk\. -f ..\charts\tesk\secrets.yaml -f ..\charts\tesk\values.yaml