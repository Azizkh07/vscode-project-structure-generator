import * as vscode from 'vscode';

export interface ProjectStructureConfig {
    outputFormat: 'json' | 'markdown' | 'txt';
    outputFileName: string;
    includeFileContent: boolean;
    maxFileSize: number;
    excludePatterns: string[];
    includeFileStats: boolean;
}

export function getConfig(): ProjectStructureConfig {
    const config = vscode.workspace.getConfiguration('projectStructure');

    return {
        outputFormat: config.get<'json' | 'markdown' | 'txt'>('outputFormat', 'markdown'),
        outputFileName: config.get<string>('outputFileName', 'PROJECT_STRUCTURE'),
        includeFileContent: config.get<boolean>('includeFileContent', false),
        maxFileSize: config.get<number>('maxFileSize', 100) * 1024,
        excludePatterns: config.get<string[]>('excludePatterns', [
            '**/node_modules/**',
            '**/.git/**',
            '**/dist/**',
            '**/out/**',
            '**/.vscode/**',
            '**/build/**',
            '**/*.log'
        ]),
        includeFileStats: config.get<boolean>('includeFileStats', true)
    };
}