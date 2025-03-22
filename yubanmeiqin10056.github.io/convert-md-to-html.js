const fs = require('fs');
const path = require('path');
const marked = require('marked');

// 配置 marked 解析器
marked.setOptions({
    renderer: new marked.Renderer(),
    gfm: true,
    breaks: false,
    pedantic: false,
    smartLists: true,
    smartypants: false
});

function convertMarkdownToHTML(mdFilePath, htmlFilePath) {
    const mdContent = fs.readFileSync(mdFilePath, 'utf8');
    const htmlContent = marked(mdContent);
    fs.writeFileSync(htmlFilePath, htmlContent);
}

// 批量转换 post 文件夹中的所有 Markdown 文件
const postDir = path.join(__dirname, 'post');
fs.readdirSync(postDir).forEach(file => {
    if (file.endsWith('.md')) {
        const mdFilePath = path.join(postDir, file);
        const htmlFilePath = path.join(postDir, file.replace('.md', '.html'));
        convertMarkdownToHTML(mdFilePath, htmlFilePath);
        console.log(`已转换: ${file} -> ${file.replace('.md', '.html')}`);
    }
});

console.log('所有 Markdown 文件已成功转换为 HTML 文件！');