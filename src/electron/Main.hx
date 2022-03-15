
package electron;

import js.Node;
import js.Node.__dirname;
import electron.main.App;
import electron.main.BrowserWindow;
import electron.main.Menu;

class Main {

	static public function main() {

		electron.main.App.on(ready, function(e) {

			var mainWindow = new BrowserWindow({
				width: 1080, 
                height: 720,
                center: true,
                frame: true,
                movable: true,
                closable: true,
				webPreferences: {
                    nodeIntegration: true,
					// devTools: true,
					enableRemoteModule: true,
                    defaultFontFamily: {
                        standard: 'Roboto'
                    },
				}
			});

			mainWindow.on(closed, function() {
				mainWindow = null;
			});

			mainWindow.setMenuBarVisibility(true);

			mainWindow.setResizable(true);
			
			mainWindow.loadFile('./src/pages/app/app.html');

			mainWindow.webContents.openDevTools();
		});

		electron.main.App.on( window_all_closed, function(e) {
			if( Node.process.platform != 'darwin' ) electron.main.App.quit();
		});
	}

}
