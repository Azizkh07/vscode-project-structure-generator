import * as path from 'path';

export function formatBytes(bytes: number): string {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
}

export function getFileExtension(filePath: string): string {
    return path.extname(filePath).toLowerCase();
}

export function getLanguage(filePath: string): string | undefined {
    const ext = getFileExtension(filePath);
    const languageMap: { [key: string]: string } = {
        '.js': 'JavaScript',
        '.ts': 'TypeScript',
        '.py': 'Python',
        '.java': 'Java',
        '.cpp': 'C++',
        '.c': 'C',
        '.cs': 'C#',
        '.go': 'Go',
        '.rs': 'Rust',
        '.php': 'PHP',
        '.rb': 'Ruby',
        '.swift': 'Swift',
        '.kt': 'Kotlin',
        '.scala': 'Scala',
        '.html': 'HTML',
        '.css': 'CSS',
        '.scss': 'SCSS',
        '.json': 'JSON',
        '.xml': 'XML',
        '.yaml': 'YAML',
        '.yml': 'YAML',
        '.md': 'Markdown',
        '.txt': 'Text',
        '.sh': 'Shell',
        '.bat': 'Batch',
        '.sql': 'SQL',
        '.r': 'R',
        '.m': 'MATLAB',
        '.dart': 'Dart',
        '.vue': 'Vue',
        '.jsx': 'JSX',
        '.tsx': 'TSX'
    };

    return languageMap[ext];
}