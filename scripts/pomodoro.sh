#!/bin/zsh
# inspired from http://feedelli.org/2012/07/29/bash-command-line-pomodoro-timer.html
# punch-time-tracking: http://code.google.com/p/punch-time-tracking/
# toggl-cli: https://github.com/drobertadams/toggl-cli
#
# with awesome-client, you need do something in your rc.lua:
#
#       ...
#       require("awful.remote") -- make `awesome-client` work
#       ...
#       pomodoro = awful.widget.progressbar()
#       pomodoro:set_max_value(100)
#       pomodoro:set_background_color('#494B4F')
#       pomodoro:set_color('#AECF96')
#       pomodoro:set_gradient_colors({ '#AECF96', '#88A175', '#FF5656' })
#       pomodoro:set_ticks(true)
#       ...
#       mywibox[s].widgets = {
#           ...
#           mytaglist[s],
#           pomodoro.widget,    -- right here
#       ...
#
clean_up() {
    #todo.sh stop $(cat ${TODO_DIR}/var/latest.tid) > /dev/null 2>&1

    # 结束 Punch.py 里面的计时，强迫自己手工重设每个工作闹钟
    # python $TODO_DIR/opt/punch/Punch.py out > /dev/null 2>&1
    #
    # 计时改由在线的 Toggl 服务实现
    #$TODO_DIR/opt/toggl/toggl.py stop > /dev/null 2>&1

    echo "pomodoro:set_background_color('#494B4F');pomodoro:set_value(0);" | awesome-client
    echo "pomodoro_text:set_text(' 25:00')" | awesome-client
    should_tick=false
    pkill pomodoro.sh
	exit 0
}

should_tick=true

tick() {
    while true
    do 
        if [ "$should_tick" = true ] ; then
            play /home/vjousse/dotfiles/pymodoro/fb/timing.wav > /dev/null 2>&1
        else
            echo 'not tick'
        fi
        #sleep 0.7
    done
}

trap clean_up HUP INT TERM KILL

work=$((25*60))
#work=$((0.1*60))
#Remove float part, just in case we're trying strange values
work=${work%.*}
rest=$((5*60))
#rest=$((0.1*60))
tdid=${1}
turn=${2}

for t in $(seq ${turn}); do
    echo "pomodoro:set_background_color('#494B4F');pomodoro:set_width(100);" | awesome-client

    tick&
    tickpid=$!
    #for i in $(seq 100); do
    #    echo "pomodoro:set_value(${i})" | awesome-client
    #    sleep $(echo "scale=3;${work}/100" | bc)
    #done

    for i in $(seq $work); do
        progress_value=$(( ($i * 100)/$work ))
        seconds_left=$(($work-$i))
        minutes_left=`date -u -d @${seconds_left} +"%M:%S"`
        echo "pomodoro:set_value(${progress_value})" | awesome-client
        echo "pomodoro_text:set_text(' ${minutes_left}')" | awesome-client
        sleep 1
        #sleep $(echo "scale=3;${work}/100" | bc)
    done

    should_tick=false
    kill $tickpid
    play /home/vjousse/dotfiles/pymodoro/session.wav > /dev/null 2>&1
    # 工作时间结束
    echo 'local naughty = require("naughty"); naughty.notify({ margin = 4, position = "bottom_left", timeout=300, text = "Time to stop work and take a little break."})' | awesome-client

    # 休息时间开始
    for i in $(seq 100); do
        j=$((100-i+1))
        echo "pomodoro:set_width(${j})" | awesome-client
        sleep $(echo "scale=3;${rest}/100" | bc)
    done

    play /home/vjousse/dotfiles/pymodoro/break.wav > /dev/null 2>&1
done
clean_up
