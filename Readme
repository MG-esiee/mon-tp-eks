#  mon-tp-eks - DevOps & Infrastructure as Code Learning Project

Un projet complet de travaux pratiques couvrant les fundations du DevOps, infrastructure as code, CI/CD, et orchestration Kubernetes.

##  Vue d'ensemble

Ce dépôt contient plusieurs modules d'apprentissage progressifs (Ch1, TD2, TD3, TD5, TD6) explorant différents aspects du DevOps et de l'infrastructure :

- **Ch1** : Introduction avec une application d'exemple simple
- **TD2** : Automatisation avec Ansible et Terraform/OpenTofu  
- **TD3** : Orchestration complète (Nginx, Docker, Kubernetes, etc.)
- **TD5** : CI/CD avec GitHub Actions et déploiement automatisé
- **Bonus** : Support AWS, Packer, lambda

---

##  Structure du projet

### `ch1/` - Démarrage simple
```
ch1/sample-app/
└── app.js          # Application Node.js basique ("Hello, World!")
```

### `devops_base/td2/` - Automatisation Infrastructure (Ansible + Terraform/OpenTofu)
```
devops_base/td2/scripts/
├── ansible/                          # Configuration Ansible
│   ├── create_ec2_instance_playbook.yml
│   ├── configure_sample_app_playbook.yml
│   ├── inventory.aws_ec2.yml
│   ├── group_vars/
│   └── roles/sample-app/
├── modules/                          # Modules Terraform/OpenTofu
│   └── ec2-instance/
│   └── live/sample-app/
└── packer/                           # Images machine Packer
    ├── sample-app.pkr.hcl
    └── app.js
```

**Fonctionnalités :**
- Provisionner des instances EC2 sur AWS avec Ansible
- Créer des groupes de sécurité et paires de clés
- Configurer l'application exemple sur les instances
- Templates Packer pour créer des images préconfigurées

---

### `devops-book/td3/` - Orchestration Multi-Serveurs & Kubernetes

```
devops-book/td3/scripts/
├── ansible/                          # Playbooks avancées
│   ├── create_ec2_instances_playbook.yml    # Déployer plusieurs instances
│   ├── configure_nginx_playbook.yml         # Web proxy
│   ├── configure_sample_app_playbook.yml
│   ├── group_vars/
│   ├── roles/
│   │   ├── nginx/
│   │   ├── nodejs-app/
│   │   └── sample-app/
│   └── inventory.aws_ec2.yml
├── docker/                           # Dockerisation de l'app
│   ├── Dockerfile
│   └── app.js
├── kubernetes/                       # Manifestes K8s
│   ├── sample-app-deployment.yml
│   └── sample-app-service.yml
├── packer/                           # Images préconfigurées
│   └── sample-app.pkr.hcl
└── tofu/                            # Infrastructure as Code
    ├── live/                         # Configurations déploiement
    │   ├── asg-sample/              # Auto Scaling Groups
    │   ├── ecr-sample/              # Registre Docker AWS
    │   └── ...
    └── modules/
```

**Fonctionnalités :**
- Architecture multi-serveurs avec Nginx comme proxy inverse
- Conteneurisation Docker de l'application Node.js
- Déploiement Kubernetes avec manifestes
- Infrastructure as Code avec OpenTofu (Terraform)
- Auto Scaling Groups et registres ECR

---

### `td5/` - Pipeline CI/CD Automatisé

```
td5/scripts/
├── github-actions/                   # Pipelines GitHub Actions
│   ├── tofu-plan.yml                # Planifier infrastructure
│   ├── tofu-apply.yml               # Appliquer modifications
│   └── infra-tests.yml              # Tests infrastructure
├── sample-app/                       # Application Node.js v4
│   ├── package.json
│   ├── server.js
│   ├── app.js                       # Express app (/ et /name/:name)
│   ├── app.test.js
│   ├── Dockerfile
│   ├── build-docker-image.sh
│   └── views/hello.ejs
├── sample-app-feature-toggle/        # App avec toggle de features
│   ├── (structure similaire)
│   └── Dockerfile
└── tofu/                             # Infrastructure for CI/CD
    ├── live/
    │   ├── ci-cd-permissions/       # Rôles IAM & GitHub OIDC
    │   ├── lambda-sample/            # Fonctions Lambda
    │   └── tofu-state/              # Backend state S3
    └── modules/
        ├── gh-actions-iam-roles/
        ├── github-aws-oidc/
        ├── state-bucket/
        └── test-endpoint/
```

**Fonctionnalités principales :**

#### Application Node.js
- **Express.js** avec templates EJS
- Routes : `GET /` et `GET /name/:name`
- Tests unitaires Jest et intégration Supertest
- Version simple et version avec toggle de features

#### Pipeline CI/CD
-  Exécution automatique sur chaque push
-  Plan Terraform/OpenTofu
-  Apply infrastructure changes
-  Tests infrastructure et d'intégration
-  Build et push images Docker
-  Authentification AWS avec GitHub OIDC

#### Infrastructure
- Gestion état Terraform/OpenTofu
- Rôles IAM pour GitHub Actions
- Déploiement Lambda
- Integration testing endpoints

---

##  Application Exemple

### Structure
```
sample-app/
├── app.js              # Logique Express (routes)
├── server.js           # Démarrage serveur
├── package.json        # Dépendances (Express, EJS)
├── app.test.js         # Tests unitaires/intégration
├── Dockerfile          # Image Docker
└── views/hello.ejs     # Template HTML
```

### Endpoints
```
GET /              → "Hello, World!"
GET /name/:name    → Rendu EJS avec variable {name}
```

### Démarrage local
```bash
npm install
npm start          # Sur le port 8080

# Tests
npm test

# Conteneurisation
./build-docker-image.sh
```

---

## 🛠️ Technologies

| Catégorie | Outils |
|-----------|--------|
| **Scripting** | Bash, YAML |
| **Serveur** | Node.js, Express.js |
| **Tests** | Jest, Supertest |
| **Infrastructure** | Terraform/OpenTofu, Ansible, Packer |
| **Conteneurs** | Docker, Kubernetes |
| **Cloud** | AWS (EC2, Lambda, ECR, S3) |
| **CI/CD** | GitHub Actions |
| **Authentification** | GitHub OIDC, AWS IAM |

---

## 📊 Progression d'apprentissage

1. **Ch1** : Simple app → Comprendre Node.js
2. **TD2** : Infrastructure → Apprendre Ansible + Terraform/OpenTofu
3. **TD3** : Orchestration → Multi-serveurs + Kubernetes + Docker
4. **TD5** : Automatisation complète → CI/CD, tests, déploiement

---

## 🔧 Prérequis

- Node.js 21+ (pour l'app)
- Docker (pour la conteneurisation)
- Ansible (pour l'orchestration)
- OpenTofu/Terraform (pour infrastructure)
- Compte AWS (avec credentials configurées)
- Repository GitHub (pour les actions)

---

## Notes

- Le code illustre les bonnes pratiques DevOps et Infrastructure as Code
- Les playbooks Ansible sont idempotentes
- Les pipelines GitHub Actions utilisent l'authentification OIDC pour la sécurité
- Support des auto-scaling et haute disponibilité avec TD3+

---

**Livre d'référence** : "Fundamentals of DevOps and Software Delivery" - Yevgeniy Brikman
