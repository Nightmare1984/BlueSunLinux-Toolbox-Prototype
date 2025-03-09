#include <QApplication>
#include <QDir>
#include <QProcess>
#include <QStandardPaths>
#include <QUrl>

int main(int argc, char *argv[]) {
    // Initialize the application
    QApplication app(argc, argv);

    // Get the path to the script to run
    QDir scriptsDir(QStandardPaths::locate(QStandardPaths::GenericDataLocation, QString(), QStandardPaths::LocateDirectory));
    scriptsDir.cd("BlueSunLinux-Toolbox");
    QString scriptPath = scriptsDir.filePath("mouse-latency-reducer.sh");

    // Check if the script exists
    if (!QFile::exists(scriptPath)) {
        qWarning() << "Failed to find script at" << scriptPath;
        return 1;
    }

    // Start the Konsole process
    QProcess process;
    process.start("konsole", QStringList() << "--hold" << "-e" << scriptPath);

    // Wait for the process to finish
    process.waitForFinished();

    return 0;
}