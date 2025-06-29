# 令牌文件目录说明

## 目录用途
此目录用于存储各种Git平台的访问令牌文件，提供安全的令牌管理方式。

## 文件结构
```
tokens/
├── README.md           # 本说明文件
├── gitee_token         # Gitee 访问令牌文件
├── gitlab_token        # GitLab 访问令牌文件
├── github_token        # GitHub 访问令牌文件
└── .gitignore          # Git忽略文件（防止令牌泄露）
```

## 令牌文件创建方法

### 1. Gitee 令牌
```bash
# 创建 Gitee 令牌文件
echo "your_gitee_access_token" > gitee_token
chmod 600 gitee_token
```

### 2. GitLab 令牌
```bash
# 创建 GitLab 令牌文件
echo "glpat-your_gitlab_token" > gitlab_token
chmod 600 gitlab_token
```

### 3. GitHub 令牌
```bash
# 创建 GitHub 令牌文件
echo "ghp_your_github_token" > github_token
chmod 600 github_token
```

## 安全注意事项

1. **文件权限**：所有令牌文件必须设置为 600 权限
2. **Git 忽略**：确保令牌文件被 .gitignore 忽略
3. **定期轮换**：定期更新令牌内容
4. **备份安全**：备份时注意令牌文件的安全性

## 在 Docker 中使用

### 挂载方式
```bash
# 只读挂载令牌目录
-v ./keys/tokens:/home/keys/tokens:ro
```

### 环境变量配置
```bash
# 指定令牌文件路径
-e LOG_GITEE_TOKEN_FILE=/home/keys/tokens/gitee_token
-e LOG_GITLAB_TOKEN_FILE=/home/keys/tokens/gitlab_token
-e LOG_GITHUB_TOKEN_FILE=/home/keys/tokens/github_token
```

## 令牌获取方法

### Gitee 令牌
1. 登录 Gitee
2. 进入 设置 -> 私人令牌
3. 创建新令牌，选择适当的权限范围
4. 复制生成的令牌

### GitLab 令牌
1. 登录 GitLab
2. 进入 User Settings -> Access Tokens
3. 创建 Personal Access Token
4. 选择 api 权限范围
5. 复制生成的令牌

### GitHub 令牌
1. 登录 GitHub
2. 进入 Settings -> Developer settings -> Personal access tokens
3. 创建 Classic token
4. 选择 repo 权限范围
5. 复制生成的令牌

## 权限要求

### 最小权限原则
- **Gitee**: projects 权限
- **GitLab**: api 权限
- **GitHub**: repo 权限

### 推荐权限设置
- 仅授予写入指定仓库的权限
- 避免授予过多的权限范围
- 定期审查令牌权限
