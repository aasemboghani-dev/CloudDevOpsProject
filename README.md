\# Cloud DevOps AWS Project



\## Overview



End-to-end Cloud and DevOps project using AWS, Terraform, Jenkins, Docker, Kubernetes, ECR, EKS, RDS, S3, IAM, KMS, Secrets Manager and CloudWatch.



\## Architecture



Developer

&#x20;   |

&#x20;   v

GitHub

&#x20;   |

&#x20;   v

Jenkins CI/CD

&#x20;   |

&#x20;   +--> Docker Build

&#x20;   |

&#x20;   +--> Docker Test

&#x20;   |

&#x20;   +--> Amazon ECR

&#x20;   |

&#x20;   v

Amazon EKS

&#x20;   |

&#x20;   +--> Kubernetes Pods

&#x20;   |

&#x20;   +--> LoadBalancer

&#x20;   |

&#x20;   v

Application

&#x20;   |

&#x20;   v

Amazon RDS MySQL



\## AWS Infrastructure



\- VPC

\- Public and Private Subnets

\- Internet Gateway

\- NAT Gateway

\- Route Tables

\- EC2

\- IAM Role

\- Security Groups

\- Amazon ECR

\- Amazon EKS

\- Amazon RDS MySQL

\- Amazon S3

\- AWS KMS

\- AWS Secrets Manager

\- Amazon CloudWatch



\## Terraform



Terraform is used to provision and manage AWS infrastructure.



Features:



\- Remote Terraform State

\- S3 backend

\- State encryption

\- Variables

\- Outputs

\- Reusable Terraform Modules

\- Infrastructure as Code



Terraform workflow:



```bash

terraform init

terraform plan

terraform apply

terraform destroy

