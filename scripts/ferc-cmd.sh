python ~/arelle/Arelle-master/arellecmdline.py --plugins xule --xule-rule-set /Users/campbellpryde/Documents/GitHub/ferc-renderer/ValidationRulesets/Form6.zip -f /Users/campbellpryde/Documents/GitHub/ferc-renderer/SampleInstances/F6/Sample_Form_6.xbrl -v --xule-time .005 --xule-debug --noCertificateCheck --logFile /Users/campbellpryde/Documents/GitHub/ferc-renderer/output/form6/log.xml

python ~/arelle/Arelle-master/arellecmdline.py --plugin FERC/render --ferc-render-render --ferc-render-template-set /Users/campbellpryde/Documents/GitHub/ferc-renderer/RenderingTemplates/RenderingTemplates_Form_6.zip -f /Users/campbellpryde/Documents/GitHub/ferc-renderer/SampleInstances/F6/Sample_Form_6.xbrl --ferc-render-inline /Users/campbellpryde/Documents/GitHub/ferc-renderer/output/form6/Sample_Form_6.html --noCertificateCheck --ferc-render-debug


python ~/arelle/Arelle-master/arellecmdline.py --plugin FERC/render --ferc-render-render --ferc-render-template-set /Users/campbellpryde/Documents/GitHub/ferc-renderer/RenderingTemplates/RenderingTemplates_Form_1.zip -f /Users/campbellpryde/Documents/GitHub/ferc-renderer/SampleInstances/F1/Sample_Form_1.xbrl --ferc-render-inline /Users/campbellpryde/Documents/GitHub/ferc-renderer/output/form1/Sample_Form_1.html --noCertificateCheck --ferc-render-debug


python ~/arelle/Arelle-master/arellecmdline.py --plugins xule --xule-rule-set /Users/campbellpryde/Documents/GitHub/ferc-renderer/ValidationRulesets/Form6.zip -f /Users/campbellpryde/Documents/GitHub/ferc-renderer/SampleInstances/F6/Sample_Form_6.xbrl -v --xule-time .005 --xule-debug --noCertificateCheck --logFile /Users/campbellpryde/Documents/GitHub/ferc-renderer/output/form6/log.xml  --xule-arg report-year-guess=2018-12-31


