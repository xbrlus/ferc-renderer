# FERC eForms Renderer

To render forms using the Arelle processor, the XULE plugin and FERC render plugin are used.

# Deployment and Usage

## <a name="deploying"></a>Deploying the FERC eForms renderer plugin for Arelle
### Windows/Mac/Linux Application Install
1. Download the latest version of [Arelle](http://arelle.org/pub/) to your environment and install. 
2. Download the latest release archive of the [FERC Renderer plugin](../../releases) 
3. Extract the archive and copy the ```plugin/xule``` folder and files and ```plugin\FERC``` folder and files to the plugin directory of Arelle in your environment (if prompted, overwrite files in the existing xule subfolder). In a Windows environment, this would be located on a path similar to C:\Program Files\Arelle\plugin; on a Mac, the location would be at /Applications/Arelle.app/Contents/MacOS/plugin. 

### Source Install
* Download the latest version of [Arelle](https://github.com/Arelle/Arelle/releases) fro GitHub to your environment and install. 
* Install the following modules to python:
  * isodate
  * aniso8601
  * numpy
* Follow steps 2 and 3 from the **Windows/Mac/Linux Application Install** section above to add the xule and FERC plugin folders and files to the plugin directory of Arelle. The Arelle location is where the Arelle source code from GitHub was extracted on the local machine or server. The Arelle plugin foler is at ```arelle/plugin``` in the source distribution. For *step 2*, add the xule and FERC folders and files to the ```arelle/plugin``` folder.

The FERC plugin requires **Python 3.5** or later and is **not compatible with earlier versions of Python**.
