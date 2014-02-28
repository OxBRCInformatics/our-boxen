class projects::mdr {
  

  boxen::project { 'mc':
    #dotenv        => true,
    #elasticsearch => true,
    #mysql         => true,
    source        => 'modelcatalogue/ModelCatalogue'
  }
}