#!/usr/bin/env bash
#Author: Mitesh The Mouse
#Email: mitsharm@redhat.com
#License: GPLv3
#Team: PFE 
#Product: Lab-Manager


_lab_manager_complete()
{
    local cur_opt prev_opt
    cur_opt="${COMP_WORDS[COMP_CWORD]}"
    prev_opt="${COMP_WORDS[COMP_CWORD-1]}"
    cmd_opts="prep cleanup deploy destroy reset reconfigure refresh help"
    case ${COMP_CWORD} in
        1)
            COMPREPLY=($(compgen -W "$cmd_opts" -- $cur_opt))
            ;;
        2)
            case ${prev_opt} in
                prep)
                    COMPREPLY=($(compgen -W "-c" -- $cur_opt))
                    ;;
                cleanup)
                    COMPREPLY=($(compgen -W "-c" -- $cur_opt))
                    ;;
                deploy)
                    COMPREPLY=($(compgen -W "-i -p" -- $cur_opt))
                    ;;
                reset)
                    COMPREPLY=($(compgen -W "-i -p" -- $cur_opt))
                    ;;
                destroy)
                    COMPREPLY=($(compgen -W "-i -p" -- $cur_opt))
                    ;;
                reconfigure)
                    COMPREPLY=($(compgen -W "-i -p" -- $cur_opt))
                    ;;
                refresh)
                    COMPREPLY=($(compgen -W "satellite" -- $cur_opt))
                    ;;
            esac
            ;;
        3)
            case ${prev_opt} in
                -i)
                    COMPREPLY=($(compgen -W "$(ls /srv/lab-manager/environments/instances | sed 's#/##' )" -- $cur_opt))
                    ;;
                -p)
                    COMPREPLY=($(compgen -W "$(ls /srv/lab-manager/environments/pods | sed 's#/##' )" -- $cur_opt))
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "$(ls /srv/lab-manager/environments/courses | sed 's#/##' )" -- $cur_opt))
                    ;;
            esac
            ;;
        *)
            COMPREPLY=()
            ;;
    esac
}
complete -F _lab_manager_complete lab

