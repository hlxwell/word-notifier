require 'ruby-growl'
require 'json'
require 'nokogiri'

class WordNotifier
  API_KEY = "566627283"

  def initialize
    @growl = Growl.new "localhost", "efficient memory", ["Efficient Memory Notification"], nil, "123321"
    @words_doc = Nokogiri::XML(File.read("words.xml"))
    @words = @words_doc.xpath("//CustomizeListItem")
  end

  def start
    @words.each do |word|
      3.times do
        w = word["word"]
        # 1. translate
        translation = get_translate(w)
        # 2. growl show it
        @growl.notify "Efficient Memory Notification", w, translation
        # 3. say it
        `say #{w}`

        sleep(30)
      end
    end
  end

  def get_translate word
    json_value = `curl 'http://fanyi.youdao.com/fanyiapi.do?keyfrom=efficient-memory&key=#{API_KEY}&type=data&doctype=json&version=1.1&q=#{word}'`
    hash_value = JSON(json_value)
    translation = "==========\n"
    translation += hash_value["phonetic"] + "\n" if hash_value["phonetic"]
    translation += hash_value["basic"]["explains"].join("\n")
    translation += hash_value["web"].map {|web_exp| web_exp["key"] + "\n" + web_exp["value"].join(",") + "\n"}.join("---------\n")
  end
end