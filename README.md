# Git Project Toolkit

[English](#english) | [Türkçe](#türkçe)

This repository contains a set of Bash scripts that allow you to analyze the status of all your Git projects in a development folder with a single command and update them interactively.



---

<a name="english"></a>
## 🇬🇧 English

### 🚀 Overview

As developers, we often work on many different projects. Over time, it becomes difficult to track which project has been pushed to GitHub, which is up-to-date, and which has uncommitted changes. The **Git Project Toolkit** was born to solve this problem. It allows you to take the pulse of all your projects with a single command.

### ✨ Features

*   **Bulk Analysis:** Scans all projects within a specified directory.
*   **Detailed Reporting:** Presents the status of projects in a colored and aligned table format.
*   **Visibility Detection:** Shows whether projects on GitHub are `Public` or `Private`.
*   **Comprehensive Status Check:** Detects:
    *   Uncommitted local changes (`Changes exist`).
    *   Unpushed commits (`Push awaited`).
    *   Being behind the remote (`Remote is newer`).
    *   Diverged branches (`Diverged`).
    *   Folders that have not yet been added to Git.
*   **Smart Interactive Updater:** Prioritizes safety by automating only safe operations and presents you with options in risky situations (e.g., risk of `merge conflict`).
*   **Multi-Language Support:** Supports English, Turkish, German, French, Russian, and Chinese, with the ability to easily add new languages.

### 🤔 Why Choose This Toolkit?

Compared to other professional tools, this toolkit stands out for several reasons:

*   **Lightweight and Dependency-Free:** It's a simple Bash script that runs on almost any Linux and macOS system without requiring extra installations like Python or Go.
*   **User-Friendly Interactive Interface:** The colorful, interactive menu for handling conflicts and the step-by-step interactive commit process make it incredibly easy to use, even for beginners.
*   **Built-in Multi-Language Support:** Offers a fully localized experience in English, Turkish, German, French, Russian, and Chinese, a feature rarely found in other CLI tools.
*   **Zero-Configuration:** Unlike tools that require configuration files (`.yaml`, etc.), this script works out-of-the-box. Just point it to your project folders.
*   **Transparency and Extensibility:** Being a simple shell script, it's easy to understand, modify, and extend to fit your custom workflows.

### 🛠️ Prerequisites

To run the scripts with full functionality, you need the following tools installed on your system:

1.  **Git:** The fundamental tool for managing your projects.
    *   *macOS (Homebrew):* `brew install git`
2.  **GitHub CLI (gh):** Used to query the `Public`/`Private` status of repositories.
    *   *macOS (Homebrew):* `brew install gh`
    *   After installation, you will need to log in to your account once by running `gh auth login`.

### ⚙️ Installation

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/YOUR_USERNAME/git-project-toolkit.git
    cd git-project-toolkit
    ```

2.  **Configure the Scan Directory:**
    Create a `.env` file by copying the example file.
    ```bash
    cp .env.example .env
    ```
    Now, open the `.env` file with a text editor and set the `SCAN_DIRECTORY` variable to the absolute path of the folder containing your Git projects.
    ```bash
    # .env file
    SCAN_DIRECTORY=/path/to/your/projects
    ```

3.  **Make Scripts Executable:**
    ```bash
    chmod +x bin/git-check
    chmod +x bin/git-update
    ```

### 👨‍💻 Usage

#### Checking Status

Simply run the `git-check` script from the project's root directory:

```bash
./bin/git-check
```

The script will automatically run in English by default. To force a different language, you can add the language code as an argument:

```bash
./bin/git-check tr  # For Turkish
./bin/git-check de  # For German
```

#### Updating Projects

When `git-check` finds repositories that need updating, it will ask you "Do you want to update?". If you answer `yes` or `y`, it will automatically run the `git-update` script.

If there are uncommitted changes in a repository, the script will first ask you for commit details in an interactive way, following the **Conventional Commits** standard:

*   **Commit Type:** `feat` (new feature), `fix` (bug fix), `docs`, `style`, `refactor`, `test`, `chore`.
*   **Scope (Optional):** The part of the codebase affected by the change (e.g., `git-check`, `lang`).
*   **Message:** A short description of the change.

This creates standardized and meaningful commit messages (e.g., `feat(lang): add japanese language support`).

If a repository to be updated is behind the remote, the script will present you with the **Interactive Menu**:

*   **[A]bort/[A]tla:** The safest option. It skips the repository, allowing you to handle it manually.
*   **[P]ull:** Attempts a `git pull`. Carries the risk of a merge conflict.
*   **[R]ebase:** Attempts a `git pull --rebase`. Provides a cleaner history but has the same risk of conflicts.
*   **[S]crub/[S]ert Sıfırla:** **(VERY RISKY)** Deletes all your unpushed local work and makes the project identical to the remote version.

### 🌐 Adding a New Language

The system is modular, so adding a new language is very easy:
1.  Go to the `lang/` directory.
2.  Copy the existing `lang_en.sh` file and rename it with your new language code (e.g., `lang_jp.sh`).
3.  Translate the strings inside the file to the target language.
4.  You can now run the script in your new language with `./bin/git-check jp`!

### 📄 License

This project is under the [MIT License](LICENSE).

---

<a name="türkçe"></a>
## 🇹🇷 Türkçe

### 🚀 Genel Bakış

Bir geliştirici olarak sık sık birçok farklı proje üzerinde çalışırız. Zamanla, hangi projenin GitHub'a yüklendiğini, hangisinin güncel olduğunu, hangisinde commit edilmemiş değişiklikler olduğunu takip etmek zorlaşır. **Git Project Toolkit**, bu sorunu çözmek için doğmuştur. Tek bir komutla tüm projelerinizin nabzını tutmanızı sağlar.

### ✨ Özellikler

*   **Toplu Analiz:** Belirttiğiniz bir klasördeki tüm projeleri tarar.
*   **Detaylı Raporlama:** Projelerin durumunu renkli ve hizalanmış bir tablo formatında sunar.
*   **Görünürlük Tespiti:** Projelerin GitHub üzerinde `Public` mi yoksa `Private` mı olduğunu gösterir.
*   **Kapsamlı Durum Kontrolü:**
    *   Commit edilmemiş yerel değişiklikleri (`Değişiklik var`)
    *   Push edilmemiş commit'leri (`Push bekliyor`)
    *   Remote'dan geri kalma durumunu (`Remote yeni`)
    *   Dallanma durumlarını (`Dallanma var`)
    *   Henüz Git'e eklenmemiş klasörleri tespit eder.
*   **Akıllı İnteraktif Güncelleyici:** Güvenliği ön planda tutan interaktif bir menü ile sadece güvenli işlemleri otomatik yapar, riskli durumlarda (örn: `merge conflict` riski) size seçenekler sunar.
*   **Çoklu Dil Desteği:** İngilizce, Türkçe, Almanca, Fransızca, Rusça ve Çince dillerini destekler ve kolayca yeni diller eklenebilir.

### 🤔 Neden Bu Proje Aracını Seçmelisiniz?

Diğer profesyonel araçlarla karşılaştırıldığında, bu araç seti birkaç nedenle öne çıkıyor:

*   **Hafif ve Bağımlılıksız:** Python veya Go gibi ek kurulumlar gerektirmeyen, neredeyse tüm Linux ve macOS sistemlerinde çalışan basit bir Bash betiğidir.
*   **Kullanıcı Dostu Etkileşimli Arayüz:** Çakışmaları ele almak için renkli, etkileşimli menü ve adım adım etkileşimli commit süreci, acemiler için bile kullanımı inanılmaz derecede kolaylaştırır.
*   **Dahili Çoklu Dil Desteği:** Diğer CLI araçlarında nadiren bulunan bir özellik olan İngilizce, Türkçe, Almanca, Fransızca, Rusça ve Çince dillerinde tam yerelleştirilmiş bir deneyim sunar.
*   **Sıfır Yapılandırma:** Yapılandırma dosyaları (`.yaml` vb.) gerektiren araçların aksine, bu betik kutudan çıktığı gibi çalışır. Sadece proje klasörlerinize yönlendirmeniz yeterlidir.
*   **Şeffaflık ve Genişletilebilirlik:** Basit bir kabuk betiği olduğu için, özel iş akışlarınıza uyacak şekilde anlaşılması, değiştirilmesi ve genişletilmesi kolaydır.

### 🛠️ Gereksinimler

Script'lerin tam fonksiyonla çalışabilmesi için sisteminizde şu araçların yüklü olması gerekmektedir:

1.  **Git:** Projelerinizi yönetmek için temel araç.
    *   *macOS (Homebrew):* `brew install git`
2.  **GitHub CLI (gh):** Repoların `Public`/`Private` durumunu sorgulamak için kullanılır.
    *   *macOS (Homebrew):* `brew install gh`
    *   Kurulumdan sonra bir defaya mahsus `gh auth login` komutu ile hesabınıza giriş yapmanız gerekmektedir.

### ⚙️ Kurulum

1.  **Repoyu Klonlayın:**
    ```bash
    git clone https://github.com/KULLANICI_ADINIZ/git-project-toolkit.git
    cd git-project-toolkit
    ```

2.  **Tarama Dizinini Yapılandırın:**
    Örnek dosyayı kopyalayarak bir `.env` dosyası oluşturun.
    ```bash
    cp .env.example .env
    ```
    Şimdi, `.env` dosyasını bir metin editörü ile açın ve `SCAN_DIRECTORY` değişkenini Git projelerinizi içeren klasörün mutlak yoluyla ayarlayın.
    ```bash
    # .env dosyası
    SCAN_DIRECTORY=/path/to/your/projects
    ```

3.  **Çalıştırma İzni Verin:**
    ```bash
    chmod +x bin/git-check
    chmod +x bin/git-update
    ```

### 👨‍💻 Kullanım

#### Durum Kontrolü

Projenizin ana dizinindeyken `git-check` betiğini çalıştırmanız yeterlidir:

```bash
./bin/git-check
```

Script, varsayılan olarak İngilizce çalışacaktır. Farklı bir dilde çalıştırmak isterseniz, dil kodunu argüman olarak ekleyebilirsiniz:

```bash
./bin/git-check tr  # Türkçe için
./bin/git-check de  # Almanca için
```

#### Projeleri Güncelleme

`git-check` betiği, güncellenmesi gereken repolar bulduğunda size "Güncellemek istiyor musunuz?" diye soracaktır. `evet` veya `e` cevabını verdiğinizde, `git-update` betiği otomatik olarak çalıştırılır.

Eğer bir repoda commit edilmemiş değişiklikler varsa, script önce size **Conventional Commits** standardına uygun olarak interaktif bir şekilde commit detaylarını sorar:

*   **Commit Tipi:** `feat` (yeni özellik), `fix` (hata düzeltmesi), `docs`, `style`, `refactor`, `test`, `chore`.
*   **Kapsam (İsteğe Bağlı):** Değişiklikten etkilenen kod tabanı bölümü (örn: `git-check`, `lang`).
*   **Mesaj:** Değişikliğin kısa bir açıklaması.

Bu, standart ve anlamlı commit mesajları oluşturur (örn: `feat(lang): japonca dil desteği eklendi`).

Eğer güncellenecek bir repo, remote'dan geri kalmışsa, script size **İnteraktif Menü**'yü sunar:

*   **[A]tla:** En güvenli seçenektir. Repoyu atlar ve size manuel müdahale imkanı tanır.
*   **[P]ull:** `git pull` dener. Otomatik birleştirme çakışması (merge conflict) riski taşır.
*   **[R]ebase:** `git pull --rebase` dener. Temiz bir commit geçmişi sunar ama aynı şekilde çakışma riski vardır.
*   **[S]ert Sıfırla:** **(ÇOK RİSKLİ)** Push edilmemiş tüm yerel çalışmalarınızı siler ve projeyi remote'daki haliyle eşitler.

### 🌐 Yeni Dil Ekleme

Sistem modüler olduğu için yeni bir dil eklemek çok kolaydır:
1.  `lang/` dizinine gidin.
2.  Mevcut `lang_en.sh` dosyasını kopyalayın ve yeni dil kodunuzla yeniden adlandırın (örn: `lang_jp.sh`).
3.  Dosyanın içindeki metinleri hedef dile çevirin.
4.  Artık betiği `./bin/git-check jp` komutuyla yeni dilinizde çalıştırabilirsiniz!

### 📄 Lisans

Bu proje [MIT Lisansı](LICENSE) altındadır.