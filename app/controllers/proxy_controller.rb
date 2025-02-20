require 'nokogiri'
require 'open-uri'

class ProxyController < ApplicationController
  private
  URL = 'http://localhost:3000/?format=xml'.freeze
  SERV_TRANS = "#{Rails.root}/public/server_transform.xslt".freeze
  BROWS_TRANS = '/browser_transform.xslt'.freeze

  public
  def input
  end

  def view
    @val = params[:val]
    @side = params[:side]
    url = URL + "&val=#{@val}&commit=find"
    api_response = open(url)

    if @side == 'server'
      @result = xslt_transform(api_response).to_html
    elsif @side == 'client-with-xslt'
      render xml: insert_browser_xslt(api_response).to_xml
    else
      render xml: api_response
    end
  end

  private
  def xslt_transform(data, transform: SERV_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: BROWS_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet', 'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
