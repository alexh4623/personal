//Creation of namespaces, roles, and rolebinding.

resource "kubernetes_namespace" "production" {
  metadata {
    name = "production"
  }
}

resource "kubernetes_namespace" "staging" {
  metadata {
    name = "staging"
  }
}

resource "kubernetes_role" "role" {
  for_each = toset(["production", "staging"])

  metadata {
    name      = "admin-role"
    namespace = each.key
  }

  rule {
    api_groups = [""]
    verbs      = ["*"]
    resources  = ["*"]
  }
}

resource "kubernetes_role_binding" "admin_binding" {
  for_each = toset(["production", "staging"])

  metadata {
    name      = "admin-binding"
    namespace = each.key
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "User"
    name      = "admin"
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_role" "developer_role" {
  metadata {
    name      = "developer-role"
    namespace = "staging"
  }
  rule {
    api_groups = [""]
    verbs      = ["get", "list", "create", "update"]
    resources  = ["pods", "services", "deployments"]
  }
}

resource "kubernetes_role_binding" "developer_binding" {
  metadata {
    name      = "developer-binding"
    namespace = "staging"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "developer-role"
  }

  subject {
    kind      = "User"
    name      = "developer"
    api_group = "rbac.authorization.k8s.io"
  }
}