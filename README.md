# Rendering FERC eForms with Xendr

To render 2024 and later eForms using the Arelle processor, the XULE plugin's Xendr module is used.  Earlier eForms require the FERC renderer plugin - [see release details](/releases).

## <a name="deploying"></a>Rendering eForms using Arelle and XULE with Xendr
### Windows/Mac/Linux Application Install
1. Download the latest version of [Arelle](http://arelle.org/pub/) to your environment and install. 
2. Download the latest [XULE release](https://github.com/xbrlus/xule/releases) 
3. Extract the archive and copy the ```plugin``` folder and files to the plugin directory of Arelle in your environment (if prompted, overwrite files in the existing XULE subfolder). In a Windows environment, this would be located on a path similar to C:\Program Files\Arelle\plugin; on a Mac, the location would be at /Applications/Arelle.app/Contents/MacOS/plugin. 

### Source Install
* Download the latest version of [Arelle](https://github.com/Arelle/Arelle/) from GitHub to your environment and install. 
* Install the following modules to python:
  * isodate
  * aniso8601
  * numpy
* Follow steps 2 and 3 from the **Windows/Mac/Linux Application Install** section above to add the XULE plugin folders and files to the plugin directory of Arelle. The Arelle location is where the Arelle source code from GitHub was extracted on the local machine or server. The Arelle plugin foler is at ```arelle/plugin``` in the source distribution. For *step 2*, add the XULE folders and files to the ```arelle/plugin``` folder.

The eForms rendering process requires **Python 3.10** or later and is **not compatible with earlier versions of Python**.

For a complete list of Xendr and XULE switches, run `python3 Arelle-master/arellecmdline.py --plugin 'xendr' -h` from the command line.

## Rendering a Filing
A file is rendered as a FERC eForm by processing an XBRL instance document and a template set with a XULE module called Xendr. The module takes the instance and the template set and generates an HTML file (inline XBRL). This file can be used for reviewing data in a familar format and is not filed with the FERC.

The FERC publihes different template sets for each form, including different template sets for annual and quarterly filings. Depending on the form and form period being reported a different template set should be used. 

### 2026 eForms Rendering Templates for processing
- Form 1: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form1/Combined/RenderingTemplates_Form_1.zip 
- Form 1F: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form1/Combined/RenderingTemplates_Form_1F.zip
- Form 1 3Q Electric: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form1/Combined/RenderingTemplates_Form_3Q_Electric.zip
- Form 2: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form2/Combined/RenderingTemplates_Form_2.zip
- Form 2A: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form2/Combined/RenderingTemplates_Form_2A.zip
- Form 2 3Q Gas: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form2/Combined/RenderingTemplates_Form_3Q_Gas.zip
- Form 6: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form6/Combined/RenderingTemplates_Form_6.zip
- Form 6Q: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form6/Combined/RenderingTemplates_Form_6Q.zip
- Form 60: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form60/Combined/RenderingTemplates_Form_60.zip
- Form 714: https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form714/Combined/RenderingTemplates_Form_714.zip

### Arelle command to render the instance as inline XBRL (HTML)
The templates can also be used from this repository with the following Arelle command to generate a rendered filing (exclude the _{location of ...}_ text in all examples below - this is illustrative of which file is referenced). In this example, replace 'master' with any tag or relase to specify a different rendering template and/or sample XBRL instance for processing. 

#### 2026 example
`python3 Arelle-master/arellecmdline.py --plugin 'xendr' --xendr-render --noCertificateCheck --xendr-template-set {location of template}https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form1/Combined/RenderingTemplates_Form_1.zip -f {location of instance}https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/SampleInstances/Sample_Form_1.xbrl --xendr-inline D:/sample-combined.html --noCertificateCheck --xendr-debug --xule-arg current-start=2018-01-01 --xule-arg current-end=2018-12-31 --xule-arg prior-start=2017-01-01 --xule-arg prior-end=2017-12-31 --xule-arg prior2-start=2016-01-01 --xule-arg prior2-end=2016-12-31`

Additionally, the FERC publishes seperate template sets for individual schedules, which are in the {TemplateSets}(/RenderingTemplates/Form1/) subdirectory of each eForm Rendering Templates folder in this repository.  TemplateSets can be used to render a single schedule for review instead of rendering the entire form. 

#### Formatting inline XBRL (HTML)
This will refer to an external CSS file in the template. To include the CSS file in the rendered file the following options are used:

 ``--xendr-css-file = FERC_CSS_FILE``
 
                        Identify the CSS file that sould be used. This will
                        overwrite the name of the CSS file that is included in
                        the template set.
                        
                        
 ``--xendr-inline-css``
  
                        Indicates that the CSS should be inlined in the
                        generated HTML file. This option must be used with
                        --xendr-css-file.

**These two options should be used by default.**  To include FERC rendering CSS styles from the template in the head your rendered HTML, use ``--xendr-css-file = {location of css file}form-template.css`` along with the ``--xendr-inline-css`` parameter.  _Excluding_ ``--xendr-inline-css`` will generate a separate CSS file linked within the HTML. All FERC rendering templates use **form-template.css** as the default name for CSS files.

### Arelle command to render inline XBRL (HTML) without an instance
The rendering templates can also be used to generate blank inline XBRL (HTML) forms by specifying the taxonomy entry point instead of an instance:
`.\arellecmdline.exe --plugin xendr --xendr-render --xendr-template-set {location of template}https://raw.githubusercontent.com/xbrlus/ferc-renderer/2026-04-01/RenderingTemplates/Form1/Combined/RenderingTemplates_Form_1.zip -f {location of taxonomy}https://ecollection.ferc.gov/taxonomy/form1/2026-04-01/form/form1/form-1_2026-04-01.xsd --xendr-css-file {location of css file}form-template.css --xendr-inline-css --xendr-inline {location of output}/sample-blank.html --noCertificateCheck --xendr-debug --xule-arg current-start=2018-01-01 --xule-arg current-end=2018-12-31 --xule-arg prior-start=2017-01-01 --xule-arg prior-end=2017-12-31 --xule-arg prior2-start=2016-01-01 --xule-arg prior2-end=2016-12-31`