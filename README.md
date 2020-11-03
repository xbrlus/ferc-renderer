# FERC eForms Renderer

To render forms using the Arelle processor, the XULE plugin and FERC render plugin are used.

## <a name="deploying"></a>Deploying the FERC eForms renderer plugin for Arelle
### Windows/Mac/Linux Application Install
1. Download the latest version of [Arelle](http://arelle.org/pub/) to your environment and install. 
2. Download the latest release archive of the [FERC Renderer plugin](../../releases) 
3. Extract the archive and copy the ```plugin/xule``` folder and files and ```plugin/FERC``` folder and files to the plugin directory of Arelle in your environment (if prompted, overwrite files in the existing xule subfolder). In a Windows environment, this would be located on a path similar to C:\Program Files\Arelle\plugin; on a Mac, the location would be at /Applications/Arelle.app/Contents/MacOS/plugin. 

### Source Install
* Download the latest version of [Arelle](https://github.com/Arelle/Arelle/) from GitHub to your environment and install. 
* Install the following modules to python:
  * isodate
  * aniso8601
  * numpy
* Follow steps 2 and 3 from the **Windows/Mac/Linux Application Install** section above to add the xule and FERC plugin folders and files to the plugin directory of Arelle. The Arelle location is where the Arelle source code from GitHub was extracted on the local machine or server. The Arelle plugin foler is at ```arelle/plugin``` in the source distribution. For *step 2*, add the xule and FERC folders and files to the ```arelle/plugin``` folder.

The FERC plugin requires **Python 3.5** or later and is **not compatible with earlier versions of Python**.

# Rendering a Filing

A file is rendered as a FERC form by providing the FERC renderer with the XBRL Instance document and a template set. The renderer takes the instance and the template set and generates an inline XBRL file formatted as a traditional FERC form. This document is not filed with the FERC but is used as a tool by filers and users to make the filing human readable.  This file can be used for reviewing the actual filing in a familar format.

The FERC publihes different template sets for each form, including different template sets for annual and quarterly filings. Depending on the form and form period being reported a different template set should be used. 

In addition the FERC publishes seperate template sets for individual schedules.  This means a single schedule can be rendered for review rather than rendering the entire form.

All form template sets published by the FERC are downloadable here: https://www.ferc.gov/sites/default/files/2020-09/Renderings.zip

Instructions for rendering forms are available here: https://www.ferc.gov/sites/default/files/2020-09/RenderForms.pdf

## Arelle Commands to render the filing
The command to generate a rendered  filing is as follows:

``python3 Arelle-master/arellecmdline.py --plugin FERC/render --ferc-render-render --ferc-render-template-set '{location of zip}/form1Q_combined.zip' -f {location of instance}/AepAppalachianTransmissionCompanyInc-436-2018Q1F1.xbrl' --ferc-render-inline {location of output}/MyCompanyInc-2020Q1-combined.html --ferc-render-debug``

This will refer to an external CSS file in the template. To include the css file in the rendered file the following options are used:

 `` --ferc-render-css-file = FERC_RENDER_CSS_FILE``
 
                        Identify the CSS file that sould be used. This will
                        overwrite the name of the CSS file that is included in
                        the template set.
                        
                        
  ``--ferc-render-inline-css``
  
                        Indicates that the CSS should be inlined in the
                        generated HTML file. This option must be used with
                        --ferc-render-css-file.

These two options should be used by default.  The css file that should be used is “form-template.css”.  The option in the should be “keep the css file separated” to tell it to return it as its own filing.

