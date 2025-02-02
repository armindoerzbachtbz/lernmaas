## Terraform

[![](https://embed-fastly.wistia.com/deliveries/41c56d0e44141eb3654ae77f4ca5fb41.jpg)](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code?in=terraform%2Faws-get-started&amp;wvideo=mo76ckwvz4)

Quelle: hashicorp
- - -

Terraform ist ein Open-Source- Infrastruktur als Code- Software-Tool, das von HashiCorp entwickelt wurde . Benutzer definieren und stellen die Rechenzentrumsinfrastruktur mithilfe einer deklarativen Konfigurationssprache namens HashiCorp Configuration Language (HCL) oder optional JSON bereit.

So stellen Sie die Infrastruktur mit Terraform bereit:

* **Scope**  - Identifizieren Sie die Infrastruktur für Ihr Projekt.
* **Author**  – Schreiben Sie die Konfiguration für Ihre Infrastruktur.
* **Initialize** `terraform init` – Installieren Sie die Plugins, die Terraform zum Verwalten der Infrastruktur benötigt.
* **Plan** `terraform plan` – Zeigen Sie eine Vorschau der Änderungen an, die Terraform an Ihre Konfiguration anpasst.
* **Apply** `terraform apply` – Nehmen Sie die geplanten Änderungen vor.
* **Destroy** `terraform destroy` – Löschen Sie die Infrastruktur, wenn Sie sie nicht mehr benötigen. 

**Tipp**: jede Cloud Plattform erlaubt die eben durchgeführte Aktion, z.B. das erstellen einer VM, als Template zu speichern. In diesem Template finden Sie die Werte welche nachher in die Terraform Konfiguration übertragen werden können, z.B. der Name einer VM-Vorlage.

Für die nachfolgenden Beispiele sind die CLI für Azure, AWS und das Terraform CLI zu installieren.

* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/)
* [AWS CLI](https://aws.amazon.com/de/cli/)
* [Terraform Installation](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)

Um eine VM in einer der Cloud Umgebungen (AWS, Azure, MAAS) zu erstellen, genügt es dieses Repository zu clonen, Terraform zu initialiseren und sich dem dem jeweilige CLI in der Cloud einzuloggen.

    git clone https://github.com/mc-b/lernmaas
    # In der Cloud Anmelden
    cd lernmaas/terraform/<Cloud>
    terraform init
    terraform apply -var module=<Module>
    
Wird die VM nicht mehr benötigt, kann sie wieder gelöscht werden:

    terraform destroy -var module=<Module>    
    
Für eine Liste der Module siehe [config.yaml](../config.yaml) oder [TBZ IT Module](https://github.com/tbz-it).

### Azure Cloud

In der Azure Cloud eine VM für das Modul M122 erstellen: 

    git clone https://github.com/mc-b/lernmaas
    az login
    cd lernmaas/terraform/azure
    terraform init
    terraform apply -var module=m122
    
### AWS Cloud

In der AWS Cloud eine VM für das Modul M122 erstellen:

    git clone https://github.com/mc-b/lernmaas
    
    aws configure
        AWS Access Key ID [****************....]:
        AWS Secret Access Key [****************....]:
        Default region name [us-west-2]: us-east-1
        Default output format [None]:    
    
    cd lernmaas/terraform/aws
    terraform init
    terraform apply -var module=m122

### MAAS.io

    git clone https://github.com/mc-b/lernmaas

Anpassen der Zugriffsinformationen auf die MAAS Umgebung in `maas/modules/maas/main.tf`, Variablen `api_key` und `api_url`.

    cd lernmaas/terraform/maas
    terraform init
    terraform apply -var module=m122-11
    
Die Nummer hinter dem Modulnamen, ergibt den Hostanteil für das VPN, siehe [Einbinden der Clients und Portweiterleitung](../doc/MAAS/GatewayClient.md).

**Hinweis**: der Terraform Provider von MAAS unterstützt leider, einige Parameter wie RAM Grösse, AZ nicht und sollte nur verwendet werden, wenn man sich mit MAAS.io auskennt.
   
