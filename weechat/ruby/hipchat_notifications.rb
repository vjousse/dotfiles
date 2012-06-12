# Copyright (c) 2012, Vincent Jousse - http://vincent.jousse.org

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

SCRIPT_NAME = 'hipchat_notifications'
SCRIPT_AUTHOR = 'Vincent Jousse'
SCRIPT_DESC = 'Parse hipchat notifications from bitlbee so that they are readable'
SCRIPT_VERSION = '0.1'
SCRIPT_LICENSE = 'MIT'


def weechat_init
  Weechat.register SCRIPT_NAME, SCRIPT_AUTHOR, SCRIPT_VERSION, SCRIPT_LICENSE, SCRIPT_DESC, "", ""
  #Weechat.hook_signal "*,irc_in2_privmsg", "msg_shorten", ""
  #Weechat.hook_print "", "notify_message", "GitHub", 1, "hipchat_notifications", ""
  Weechat.hook_modifier "irc_in_privmsg", "github_modifier", ""

  return Weechat::WEECHAT_RC_OK
end

def github_modifier(data, modifier, modifier_data, string)
    # add server name to all messages received
    # (ok that's not very useful, but that's just an example!)
    if string =~ /GitHub/
      "%s [GitHub line detected]" % [string]
    else
      string
    end
end
