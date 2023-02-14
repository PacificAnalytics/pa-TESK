`

Ingress

The extensions/v1beta1 and networking.k8s.io/v1beta1 API versions of Ingress is no longer served as of v1.22.

    Migrate manifests and API clients to use the networking.k8s.io/v1 API version, available since v1.19.
    All existing persisted objects are accessible via the new API
    Notable changes:
        spec.backend is renamed to spec.defaultBackend
        The backend serviceName field is renamed to service.name
        Numeric backend servicePort fields are renamed to service.port.number
        String backend servicePort fields are renamed to service.port.name
        pathType is now required for each specified path. Options are Prefix, Exact, and ImplementationSpecific. To match the undefined v1beta1 behavior, use ImplementationSpecific.

IngressClass

The networking.k8s.io/v1beta1 API version of IngressClass is no longer served as of v1.22.

    Migrate manifests and API clients to use the networking.k8s.io/v1 API version, available since v1.19.
    All existing persisted objects are accessible via the new API
    No notable changes

`

https://kubernetes.io/docs/reference/using-api/deprecation-guide/