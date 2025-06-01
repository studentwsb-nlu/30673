# Infrastruktura Cloud-Native dla Bezpiecznych i Skalowalnych Aplikacji Webowych z AWS i Terraform

## Opis projektu

Projekt demonstruje praktyczne podejście do budowy nowoczesnej, odpornej na awarie infrastruktury dla aplikacji webowej w chmurze Amazon Web Services (AWS) z wykorzystaniem narzędzia Terraform (Infrastructure as Code).

### Główne cechy:
- **Własna sieć (VPC)** z publicznymi i prywatnymi podsieciami
- **Application Load Balancer (ALB)** zapewniający równoważenie ruchu
- **Auto Scaling Group (ASG)** dla wysokiej dostępności i skalowalności
- **Instancje EC2** w prywatnych subnetach
- **Relacyjna baza danych RDS** (Multi-AZ)
- **Mechanizmy bezpieczeństwa**: izolacja sieciowa, IAM (zasady najmniejszych uprawnień), szyfrowanie, monitoring

## Struktura katalogów

```
terraform-hai/
  main.tf            # Główny plik uruchamiający infrastrukturę
  variables.tf       # Zmienne globalne
  outputs.tf         # Wyjścia
  modules/
    vpc/             # Definicja sieci VPC i subnetów
    security_groups/ # Grupy bezpieczeństwa
    alb/             # Application Load Balancer
    ec2/             # EC2, Auto Scaling, IAM, User Data
    rds/             # Baza danych RDS
```

## Szybki start

1. **Zainstaluj Terraform**: https://www.terraform.io/downloads.html
2. **Skonfiguruj poświadczenia AWS** (np. przez `aws configure` lub zmienne środowiskowe)
3. **Zainicjuj projekt**:
   ```powershell
   cd terraform-hai
   terraform init
   ```
4. **Zastosuj infrastrukturę**:
   ```powershell
   terraform apply
   ```

## Praca w środowisku GitHub Codespaces / Devcontainer

Projekt jest gotowy do uruchomienia w środowisku [GitHub Codespaces](https://github.com/features/codespaces) lub lokalnie z użyciem plików `./devcontainer`.

- W katalogu głównym repozytorium znajduje się folder `.devcontainer/` z konfiguracją środowiska developerskiego (np. Dockerfile, devcontainer.json).
- Dzięki temu możesz rozpocząć pracę bezpośrednio w chmurze lub w VS Code z pełnym wsparciem narzędzi (Terraform, AWS CLI, itp.) bez konieczności lokalnej instalacji zależności.

**Jak zacząć w Codespaces:**
1. Otwórz repozytorium w GitHub i kliknij "Code" → "Codespaces" → "New codespace".
2. Po kilku minutach środowisko będzie gotowe do pracy z preinstalowanymi narzędziami.

**Lokalnie:**
1. Otwórz repo w VS Code.
2. Zainstaluj rozszerzenie [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
3. Wybierz "Reopen in Container".

## Bezpieczeństwo
- Instancje EC2 działają w prywatnych subnetach
- Dostęp do bazy RDS tylko z EC2 (Security Group)
- IAM z zasadą najmniejszych uprawnień
- Szyfrowanie danych (RDS, komunikacja)
- Monitoring i logowanie (CloudWatch, logi ALB)

## Skalowalność i HA
- Auto Scaling Group automatycznie dostosowuje liczbę instancji EC2
- RDS Multi-AZ zapewnia wysoką dostępność bazy danych
- ALB rozkłada ruch na wiele instancji

## Autor
Projekt inżynierski: "Infrastruktura Cloud-Native dla Bezpiecznych i Skalowalnych Aplikacji Webowych z wykorzystaniem AWS i Terraform"

---

> **Uwaga:** Hasła i dane dostępowe w kodzie są przykładowe – w środowisku produkcyjnym należy korzystać z bezpiecznego zarządzania sekretami (np. AWS Secrets Manager).
