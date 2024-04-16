FROM golang:1.22-bookworm
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&\
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl &&\
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64 &&\
    chmod +x ./kind &&\
    mv ./kind /usr/local/bin/kind &&\
    curl -L https://github.com/kubernetes-sigs/cluster-api/releases/download/v1.6.3/clusterctl-linux-amd64 -o clusterctl &&\
    install -o root -g root -m 0755 clusterctl /usr/local/bin/clusterctl &&\
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 &&\
    chmod 700 get_helm.sh &&\
    ./get_helm.sh &&\
    curl -L -o kubebuilder "https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)" &&\
    chmod +x kubebuilder && mv kubebuilder /usr/local/bin/
