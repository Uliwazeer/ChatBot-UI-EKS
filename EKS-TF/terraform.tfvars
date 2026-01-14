# الـ IDs الفعلية من حسابك في فرجينيا
vpc-name            = "vpc-0e80ab2cc99e9ff7b"
igw-name            = "igw-05b1b13a3c5b26e66"
rt-name2            = "default-route-table" # تيرابورم هيستخدم الـ Route Table الافتراضي للـ VPC
subnet-name         = "subnet-08f4f48c7c3494931" # اخترت لك us-east-1a
subnet-name2        = "subnet-018b2bcb2280b5f5d" # اخترت لك us-east-1b (لازم اتنين لـ EKS)
security-group-name = "launch-wizard-1"

# أسماء الـ Roles اللي تيرابورم هيكريتها (سيبها زي ما هي)
iam-role-eks        = "chatbot-eks-role"
iam-role-node       = "chatbot-node-role"
iam-policy-eks      = "chatbot-eks-policy"
iam-policy-node     = "chatbot-node-policy"
cluster-name        = "chatbot-eks-cluster"
eksnode-group-name  = "chatbot-node-group"
