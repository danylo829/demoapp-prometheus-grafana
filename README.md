# demoapp-prometheus-grafana
Demonstration of Prometheus+Graphana monitoring using [Node.js Demo Web Application](https://github.com/benc-uk/nodejs-demoapp) as an example.
Alerts are implemented using [Telepush](https://telepush.dev/).
## Configuration
- Create and edit ```/ansible/secrets.yml``` file as follows:
```
prometheus_basic_auth_pass: "<pass>"

prometheus_user: "<user>"
prometheus_pass: "<pass>"

telepush_token: "<your token>"
```
