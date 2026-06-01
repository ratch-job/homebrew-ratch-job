# homebrew-ratch-job

ratch-job 的 Homebrew tap 仓库。

## 安装

```shell
brew tap ratch-job/ratch-job
brew install ratch-job
```

## 服务管理

通过 `brew services` 管理 ratch-job 后台服务，支持开机自启动：

```shell
# 启动服务（会自动注册为开机自启动）
brew services start ratch-job

# 停止服务
brew services stop ratch-job

# 重启服务
brew services restart ratch-job

# 查看服务状态
brew services info ratch-job
```

服务启动后可访问控制台：`http://127.0.0.1:8825/ratchjob/`

数据目录：`$(brew --prefix)/var/lib/ratchjob/`

日志文件：`$(brew --prefix)/var/log/ratchjob.log`
