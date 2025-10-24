import * as vscode from 'vscode';
import { generateProjectStructure } from './generator';
import { getConfig } from './config';

export function activate(context: vscode.ExtensionContext) {
    console.log('Project Structure Generator is now active!');
    
    try {
        let generateCommand = vscode.commands.registerCommand(
            'projectStructure.generate',
            async () => {
                console.log('Command projectStructure.generate called');
                await generateStructure(false);
            }
        );

        let generateWithContentCommand = vscode.commands.registerCommand(
            'projectStructure.generateWithContent',
            async () => {
                console.log('Command projectStructure.generateWithContent called');
                await generateStructure(true);
            }
        );

        context.subscriptions.push(generateCommand, generateWithContentCommand);
        
        // Verify commands are registered
        console.log('Commands registered successfully:', ['projectStructure.generate', 'projectStructure.generateWithContent']);
        
        // Show activation message
        vscode.window.showInformationMessage('Project Structure Generator for AI is now active!');
        
    } catch (error: any) {
        console.error('Error during extension activation:', error);
        vscode.window.showErrorMessage(`Extension activation failed: ${error.message}`);
    }
}

async function generateStructure(includeContent: boolean) {
    const workspaceFolders = vscode.workspace.workspaceFolders;

    if (!workspaceFolders || workspaceFolders.length === 0) {
        vscode.window.showErrorMessage('No workspace folder open!');
        return;
    }

    const config = getConfig();
    
    if (includeContent) {
        config.includeFileContent = true;
    }

    try {
        await vscode.window.withProgress(
            {
                location: vscode.ProgressLocation.Notification,
                title: 'Generating project structure...',
                cancellable: false
            },
            async (progress) => {
                progress.report({ increment: 0 });

                for (const folder of workspaceFolders) {
                    const outputPath = await generateProjectStructure(
                        folder.uri.fsPath,
                        config,
                        progress
                    );

                    progress.report({ increment: 100 });

                    const openFile = await vscode.window.showInformationMessage(
                        `Project structure generated: ${outputPath}`,
                        'Open File'
                    );

                    if (openFile === 'Open File') {
                        const doc = await vscode.workspace.openTextDocument(outputPath);
                        await vscode.window.showTextDocument(doc);
                    }
                }
            }
        );
    } catch (error: any) {
        vscode.window.showErrorMessage(`Error generating structure: ${error.message}`);
    }
}

export function deactivate() {}