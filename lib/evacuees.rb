# encoding: utf-8

# Load a Log4j properties file for PDFBox if it exists.
log4j_properties_path = File.expand_path('../log4j.properties', File.dirname(__FILE__))
org.apache.log4j.PropertyConfigurator.configure(log4j_properties_path) if File.file?(log4j_properties_path)

require_relative './evacuees/constants'
require_relative './evacuees/writers'
require_relative './evacuees/datapackage_json'
require_relative './evacuees/pdf_extractor'
require_relative './evacuees/pdf_downloader'
