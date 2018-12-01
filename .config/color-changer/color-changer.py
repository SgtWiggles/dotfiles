import subprocess
import datetime
import sys
import os

MORNING_TIME_HOUR = 8
NIGHT_TIME_HOUR = 19

PATH = os.path.dirname(os.path.realpath(__file__)) + "/"

def decide_time():
    time  = datetime.datetime.now().time()
    if time.hour >= NIGHT_TIME_HOUR or time.hour < MORNING_TIME_HOUR:
        set_night_theme()
    else:
        set_day_theme()

def set_i3_theme(mode):
    subprocess.call(["cat ~/.config/i3/{}_config > ~/.config/i3/config".format(mode)], shell=True)
    subprocess.call(["i3-msg", "reload"])
def set_polybar_theme(mode):
    subprocess.call(["cat ~/.config/polybar/{}_config > ~/.config/polybar/config".format(mode)], shell=True)
    subprocess.call(["polybar-msg", "cmd", "restart"])

def set_ume_theme(mode):
    if mode == "night":
        subprocess.call(["ume", "--change-colorset", "2"])
    else:
        subprocess.call(["ume", "--change-colorset", "1"])
def set_bg(mode):
    subprocess.call(["feh", "--bg-center", PATH + "./{}bg.png".format(mode)])

def set_vim_colors(mode): 
    output = subprocess.check_output(['vim', '--serverlist']).split()
    if mode == "night":
        for inst in output:
            subprocess.call(['vim', '--servername', inst, '--remote-send', '"<Esc>:set bg=dark<CR>"'])
    else:
        for inst in output:
            subprocess.call(['vim', '--servername', inst, '--remote-send', '"<Esc>:set bg=light<CR>"'])


def set_all(mode):
    set_polybar_theme(mode)
    set_i3_theme(mode)
    set_bg(mode)
    set_ume_theme(mode)
    set_vim_colors(mode)

def set_night_theme():
    set_all("night")

def set_day_theme():
    set_all("day")
    
def main():
    if len(sys.argv) == 1:
        decide_time()
    elif len(sys.argv) == 2:
        if sys.argv[1] == "night":
            set_night_theme()
        elif sys.argv[1] == "day":
            set_day_theme()
        else:
            print("The second argument can only be day or night")

main()
