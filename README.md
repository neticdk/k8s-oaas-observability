# k8s-oaas-observability
Operations as a Service for kubernetesis a "shift-left" approach for development for security and operations. 
Operations as a Service for kubernetes consists of a number of repositories, where this is the foundation because it contains the Observability part that makes operations possible. 
This repository includes the Observability package, there are other packages under the OaaS umbrella such as:

* [observable cluster (potential common ingestpoint for operations on-demand)](https://github.com/neticdk/k8s-oaas-observability)

* [secure cluster (gitOps based secDevOps Control Plane)](https://github.com/neticdk/k8s-oaas-sccd)
  
* [cluster tools (advanced secrets management including backup and restore)](https://github.com/neticdk/k8s-oaas-tools) 

Kubernetes Operations as a Service - Observability consist of a helm chart and an Operator that prepares a kubernetes cluster for being observable.

# Operations as a Service - Observability 
Observability consists of Logs, Metrics and Traces, currently this includes the former two and traces are added at a later stage. 
This package allows for a standardised way to observe your kubernetes cluster and have a standardised set of alerts defined for the cluster. This includes metrics for the cluster components, the nodes etc. with dashboards in Grafana.
Currently the main concern is to enable observability for kubernetes clusters locally running anywhere and have a well-defined way to connect these observable clusters to a common ingest point as this allows for a common place for observing a group of clusters in one place. Furthermore that common observability ingest point allows individual cluster teams to have bits and pieces of their operations performed by an operations provider or indeed have their cluster operated entirely by an operations provider.

The package is built on the basis of well-known products like Prometheus, Grafana and Vector, and is installed using Helm.

***If you want to try it out in your local cluster [installation](charts/kube-state-metrics/README.md)*** 

# Operations On-Demand

It is possible to link that observable cluster to a global operations provider observer ingest, which allows you to see clusters together in one place and allows for a best effort operations.

Furthermore this lays the foundation for using Operations On-Demand and change from a 100% DevOps driven setup towards having the level of operations needed by each individual team. 

* An example of Operation On-Demand could be to have an operations provider delivering operations e.g. during evenings and weekends, vacations etc. Or if the team is busy elsewhere the operations provider takes care of operations.

* so how does Operations On-Demand work? 

    * operations is the deterministic reaction to an occured event. Events can be things like alerts (or incidents as they are phrased in the operations terminology). Each of these events that needs to be operated can be transformeed into instructions that allows for reaction in a proper way and thus resolve or mitigate the effects of that event.
  
    * these instructions can be used by the team as well as other people around the team as well as being used by the operations provider. 

    *  if an event (e.g. a triggered alert) occurs the team can react to that, if they did not managed to do this within the latency that is set up for the operations provider to react, the operations provider will react to the event according to the instructions available and do that e.g. around the clock.

    * this means your team can do what ever they can overcome and have a good work-life balance and spend time on what is most important and do a real prioritisation between development of features and the continued operations of already available features.

**...more information on the common ingest point - please contact ca@netic.dk** and see how that could help you and your team.
