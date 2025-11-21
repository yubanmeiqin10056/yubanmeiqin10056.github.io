# 添加新博客文章

要添加新博客文章，您需要在 `_posts` 目录下创建一个文件，文件名必须遵循格式：`YYYY-MM-DD-文章标题.md`

## 基本格式

每个文章文件都应该包含以下 front matter：

```yaml
---
layout: post
title: "文章标题"
date: 2025-01-01 12:00:00 +0800
author: "御坂10056号"
---
```

## 说明

- `layout: post` - 确保文章使用正确的布局
- `title` - 文章标题
- `date` - 发布日期，格式为 `YYYY-MM-DD HH:MM:SS +0800`
- `author` - 作者名称

## 简单模板

您可以复制以下模板并修改日期和标题：

```
---
layout: post
title: "在这里输入标题"
date: 2025-01-01 12:00:00 +0800
author: "御坂10056号"
---

# 在这里输入文章标题

这里是文章内容...
```

注意：Jekyll 需要 front matter 来处理 Markdown 文件。如果省略 front matter，文件将不会被转换为网页。