ruby -rubygems -e 'require "jekyll-import";
JekyllImport::Importers::WordpressDotCom.run({
        "source" => "/Users/jrepp/src/mvcowboys.bak/backup/missionviejocowboys.wordpress.2014-06-29.xml",
        "no_fetch_images" => true,
        "assets_folder" => "assets"
        })'
