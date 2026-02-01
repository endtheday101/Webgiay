# WebGiay3 - Hướng dẫn Git/GitHub Workflow

## Thông tin Repository
- **Repository**: https://github.com/endtheday101/Webgiay
- **Branch chính**: `main`

---

## Quy trình làm việc với Git/GitHub

### 1. Tạo branch mới cho tính năng

Luôn tạo branch mới khi phát triển tính năng hoặc sửa lỗi:

```bash
# Tạo và chuyển sang branch mới
git checkout -b feature/ten-tinh-nang

# Ví dụ cụ thể:
git checkout -b feature/them-gio-hang
git checkout -b feature/thanh-toan
git checkout -b bugfix/sua-loi-dang-nhap
```

**Quy tắc đặt tên branch:**
- `feature/` - cho tính năng mới
- `bugfix/` - cho sửa lỗi
- `hotfix/` - cho sửa lỗi khẩn cấp
- Sử dụng dấu gạch ngang `-` thay vì khoảng trắng

---

### 2. Làm việc và commit code

Sau khi code xong, commit thay đổi:

```bash
# Kiểm tra file đã thay đổi
git status

# Thêm tất cả file vào staging
git add .

# Hoặc thêm từng file cụ thể
git add src/main/java/com/example/Controller.java

# Commit với message rõ ràng
git commit -m "Mô tả chi tiết những gì đã làm"

# Ví dụ:
git commit -m "Thêm chức năng giỏ hàng với các tính năng thêm/xóa/cập nhật"
git commit -m "Sửa lỗi hiển thị giá sản phẩm"
```

**Tips viết commit message tốt:**
- Ngắn gọn, rõ ràng (dưới 50 ký tự)
- Bắt đầu bằng động từ: Thêm, Sửa, Xóa, Cập nhật
- Mô tả **cái gì** đã làm, không phải **tại sao**

---

### 3. Push branch lên GitHub

```bash
# Push branch lần đầu
git push -u origin feature/ten-tinh-nang

# Các lần push sau
git push

# Ví dụ:
git push -u origin feature/them-gio-hang
```

---

### 4. Tạo Pull Request (PR) trên GitHub

1. Truy cập: https://github.com/endtheday101/Webgiay
2. Click nút **"Pull requests"**
3. Click **"New pull request"**
4. Chọn:
   - **base**: `main` (branch đích)
   - **compare**: `feature/ten-tinh-nang` (branch nguồn)
5. Click **"Create pull request"**
6. Điền tiêu đề và mô tả chi tiết
7. Click **"Create pull request"**

**Review và Merge:**
- Review code kỹ lưỡng
- Test tính năng
- Click **"Merge pull request"** khi đã sẵn sàng
- Click **"Confirm merge"**
- Xóa branch sau khi merge (GitHub sẽ gợi ý)

---

### 5. Cập nhật code local từ main

Sau khi merge PR, cập nhật code local:

```bash
# Chuyển về branch main
git checkout main

# Pull code mới nhất từ GitHub
git pull origin main
```

---

### 6. Xóa branch đã merge

```bash
# Xóa branch local
git branch -d feature/ten-tinh-nang

# Xóa branch trên GitHub (nếu chưa xóa)
git push origin --delete feature/ten-tinh-nang

# Ví dụ:
git branch -d feature/them-gio-hang
git push origin --delete feature/them-gio-hang
```

---

## Workflow hoàn chỉnh (Ví dụ)

```bash
# 1. Cập nhật main mới nhất
git checkout main
git pull origin main

# 2. Tạo branch mới
git checkout -b feature/them-gio-hang

# 3. Code và commit
# ... (code here) ...
git add .
git commit -m "Thêm chức năng giỏ hàng"

# 4. Push lên GitHub
git push -u origin feature/them-gio-hang

# 5. Tạo Pull Request trên GitHub
# ... (làm trên web) ...

# 6. Sau khi merge, quay về main
git checkout main
git pull origin main

# 7. Xóa branch cũ
git branch -d feature/them-gio-hang
```

---

## Các lệnh Git hữu ích

### Kiểm tra trạng thái
```bash
# Xem trạng thái hiện tại
git status

# Xem lịch sử commit
git log

# Xem lịch sử ngắn gọn
git log --oneline

# Xem branch hiện tại
git branch

# Xem tất cả branch (local + remote)
git branch -a
```

### Quản lý branch
```bash
# Chuyển branch
git checkout ten-branch

# Tạo branch mới (không chuyển)
git branch feature/ten-moi

# Đổi tên branch hiện tại
git branch -m ten-moi

# Xem branch đang tracking
git branch -vv
```

### Hoàn tác thay đổi
```bash
# Hủy thay đổi file chưa commit
git checkout -- ten-file

# Hủy tất cả thay đổi chưa commit
git reset --hard

# Hủy commit cuối (giữ thay đổi)
git reset --soft HEAD~1

# Hủy commit cuối (xóa thay đổi)
git reset --hard HEAD~1
```

### Đồng bộ với remote
```bash
# Xem remote
git remote -v

# Fetch thông tin từ remote (không merge)
git fetch origin

# Pull = Fetch + Merge
git pull origin main

# Push force (cẩn thận!)
git push -f origin branch-name
```

---

## Lưu ý quan trọng

1. **KHÔNG bao giờ** commit trực tiếp lên `main`
2. **LUÔN** tạo branch mới cho mỗi tính năng
3. **LUÔN** pull code mới nhất trước khi tạo branch mới
4. **LUÔN** test kỹ trước khi merge vào `main`
5. **KHÔNG** push force lên `main` (trừ khi thực sự cần thiết)
6. **NÊN** commit nhỏ và thường xuyên
7. **NÊN** viết commit message rõ ràng
8. **NÊN** xóa branch sau khi merge

---

## Thêm thành viên mới vào dự án

### Bước 1: Đăng nhập GitHub (Cho thành viên mới)

**Nếu chưa có tài khoản GitHub:**
1. Truy cập: https://github.com/signup
2. Điền thông tin:
   - Email
   - Password (ít nhất 15 ký tự hoặc 8 ký tự với số và chữ thường)
   - Username (tên duy nhất)
3. Xác thực email
4. Hoàn tất đăng ký

**Nếu đã có tài khoản:**
1. Truy cập: https://github.com/login
2. Đăng nhập với email/username và password

---

### Bước 2: Thêm Collaborator (Cho Owner/Admin)

**Owner của repository thực hiện:**

1. Truy cập repository: https://github.com/endtheday101/Webgiay
2. Click tab **"Settings"** (ở menu trên cùng)
3. Trong menu bên trái, click **"Collaborators and teams"**
4. Click nút **"Add people"**
5. Nhập username hoặc email của thành viên mới
6. Click **"Add [username] to this repository"**
7. Chọn quyền:
   - **Read**: Chỉ xem code
   - **Write**: Xem, clone, push code (khuyến nghị cho developer)
   - **Admin**: Toàn quyền quản lý repository

**Lưu ý:** Thành viên mới sẽ nhận email mời tham gia repository.

---

### Bước 3: Chấp nhận lời mời (Cho thành viên mới)

1. Kiểm tra email từ GitHub
2. Click link **"View invitation"** trong email
3. Hoặc truy cập: https://github.com/endtheday101/Webgiay
4. Click nút **"Accept invitation"**

---

### Bước 4: Clone repository về máy (Cho thành viên mới)

**Cài đặt Git (nếu chưa có):**
- Windows: Tải từ https://git-scm.com/download/win
- Mac: `brew install git`
- Linux: `sudo apt-get install git`

**Cấu hình Git lần đầu:**
```bash
# Thiết lập tên và email
git config --global user.name "Tên của bạn"
git config --global user.email "email@example.com"

# Kiểm tra cấu hình
git config --list
```

**Clone repository:**
```bash
# Di chuyển đến thư mục muốn lưu project
cd /path/to/your/workspace

# Clone repository
git clone https://github.com/endtheday101/Webgiay.git

# Di chuyển vào thư mục project
cd Webgiay
```

**Xác thực GitHub (lần đầu clone/push):**

Khi clone hoặc push lần đầu, Git sẽ yêu cầu đăng nhập. Có 2 cách:

**Cách 1: Personal Access Token (Khuyến nghị)**
1. Truy cập: https://github.com/settings/tokens
2. Click **"Generate new token"** → **"Generate new token (classic)"**
3. Đặt tên token (VD: "WebGiay3 Development")
4. Chọn quyền: `repo` (full control of private repositories)
5. Click **"Generate token"**
6. **Copy token ngay** (chỉ hiển thị 1 lần!)
7. Khi Git yêu cầu password, paste token vào

**Cách 2: GitHub CLI**
```bash
# Cài đặt GitHub CLI
# Windows: tải từ https://cli.github.com/
# Mac: brew install gh
# Linux: sudo apt install gh

# Đăng nhập
gh auth login

# Chọn:
# - GitHub.com
# - HTTPS
# - Yes (authenticate Git)
# - Login with a web browser
```

---

### Bước 5: Bắt đầu làm việc (Cho thành viên mới)

```bash
# 1. Kiểm tra trạng thái
git status

# 2. Xem các branch hiện có
git branch -a

# 3. Tạo branch mới cho tính năng của bạn
git checkout -b feature/ten-tinh-nang-cua-ban

# 4. Bắt đầu code!
```

**Quy trình làm việc hàng ngày:**
```bash
# Sáng: Cập nhật code mới nhất
git checkout main
git pull origin main

# Tạo nhánh mới và chuyển sang nhánh đó (1 lệnh)
git checkout -b van/login

# ... Viết code chức năng login... => sau khi viết xong


# Xem file nào đã thay đổi
git status

# Code, commit, push

git add .
git commit -m "Mô tả chức năng"

git push -u origin van/login

# Tạo Pull Request trên GitHub để review
```
sau đó check ở pull requests => new pull requests chọn basse: main - compare: van/login xong thì bắt đầu

git checkout main và git pull origin main để lấy tính năng mới
---

### Bước 6: Quy tắc làm việc nhóm

**Quy tắc bắt buộc:**
1. **LUÔN** tạo branch mới, **KHÔNG** code trực tiếp trên `main`
2. **LUÔN** pull code mới nhất trước khi bắt đầu làm việc
3. **LUÔN** tạo Pull Request để review code
4. **LUÔN** viết commit message rõ ràng
5. **KHÔNG** push force lên `main`
6. **KHÔNG** commit file cấu hình cá nhân (.env, IDE settings)
7. **KHÔNG** commit file build (target/, node_modules/)

**Quy tắc đặt tên:**
- Branch: `feature/ten-tinh-nang`, `bugfix/ten-loi`
- Commit: "Thêm chức năng X", "Sửa lỗi Y"
- Pull Request: Tiêu đề rõ ràng + mô tả chi tiết

---

### Bước 7: Kiểm tra quyền truy cập

```bash
# Kiểm tra remote repository
git remote -v

# Kết quả mong đợi:
# origin  https://github.com/endtheday101/Webgiay.git (fetch)
# origin  https://github.com/endtheday101/Webgiay.git (push)

# Test push (tạo branch test)
git checkout -b test/check-permission
git push -u origin test/check-permission

# Nếu thành công → Có quyền Write
# Nếu lỗi "Permission denied" → Liên hệ owner để cấp quyền
```

---

## Xử lý tình huống thường gặp

### Conflict khi merge
```bash
# 1. Pull code mới nhất
git pull origin main

# 2. Giải quyết conflict trong file
# ... (sửa file thủ công) ...

# 3. Add và commit
git add .
git commit -m "Giải quyết conflict"

# 4. Push
git push
```

### Quên tạo branch, đã code trên main
```bash
# 1. Tạo branch mới (giữ thay đổi)
git checkout -b feature/ten-tinh-nang

# 2. Commit và push
git add .
git commit -m "Mô tả"
git push -u origin feature/ten-tinh-nang
```

### Muốn cập nhật branch với code mới từ main
```bash
# Đang ở branch feature
git checkout main
git pull origin main
git checkout feature/ten-tinh-nang
git merge main
# Hoặc: git rebase main
```

---

## Tài liệu tham khảo

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)

---

**Cập nhật lần cuối**: 01/02/2026
