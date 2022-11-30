require 'nokogiri'
require 'open-uri'
class PalindromsController < ApplicationController
  def index
  end
  def result
    @number = params[:num].to_i
    redirect_to home_path, notice: 'Вводите числа >= 0' if @number.negative?
    @side = params[:side]
    my_url = URL + "&num=#{@number}"
    server_response = URI.open(my_url)
    if @side == 'html'
      @result = xslt_trans(server_response).to_html
    elsif @side == 'xml'
      @result = Nokogiri::XML(server_response)
    else
      @result = insert_xslt_line(server_response)
    end
  end


  private
  URL = 'http://localhost:3000/?format=xml'.freeze
  SERV_TRANS = "#{Rails.root}/public/transform.xslt".freeze
  BROWS_TRANS = '/server_transform.xslt'.freeze

  def xslt_trans(data, transform: SERV_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_xslt_line(data, transform: BROWS_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(
    doc,'xml-stylesheet', 'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end