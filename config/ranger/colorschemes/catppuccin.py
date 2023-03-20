
# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    #1e1e2e, #89b4fa, #74c7ec, #a6e3a1, #cba6f7, #f38ba8, #cdd6f4, #f9e2af, default,
    normal, bold, reverse, dim, BRIGHT,
    default_colors,
)


class Default(ColorScheme):
    progress_bar_color = #89b4fa

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                bg = #f38ba8
            if context.border:
                fg = default
            if context.media:
                if context.image:
                    fg = #f9e2af
                else:
                    fg = #cba6f7
            if context.container:
                fg = #f38ba8
            if context.directory:
                attr |= bold
                fg = #89b4fa
                fg += BRIGHT
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                attr |= bold
                fg = #a6e3a1
                fg += BRIGHT
            if context.socket:
                attr |= bold
                fg = #cba6f7
                fg += BRIGHT
            if context.fifo or context.device:
                fg = #f9e2af
                if context.device:
                    attr |= bold
                    fg += BRIGHT
            if context.link:
                fg = #74c7ec if context.good else #cba6f7
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (#f38ba8, #cba6f7):
                    fg = #cdd6f4
                else:
                    fg = #f38ba8
                fg += BRIGHT
            if context.line_number and not context.selected:
                fg = default
                attr &= ~bold
            if not context.selected and (context.cut or context.copied):
                attr |= bold
                fg = #1e1e2e
                fg += BRIGHT
                # If the terminal doesn't support bright colors, use dim #cdd6f4
                # instead of #1e1e2e
                if BRIGHT == 0:
                    attr |= dim
                    fg = #cdd6f4
            if context.main_column:
                # Doubling up with BRIGHT here causes issues because it's
                # additive not idempotent.
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = #f9e2af
            if context.badinfo:
                if attr & reverse:
                    bg = #cba6f7
                else:
                    fg = #cba6f7

            if context.inactive_pane:
                fg = #74c7ec

        elif context.in_titlebar:
            if context.hostname:
                fg = #f38ba8 if context.bad else #a6e3a1
            elif context.directory:
                fg = #89b4fa
            elif context.tab:
                if context.good:
                    bg = #a6e3a1
            elif context.link:
                fg = #74c7ec 
            attr |= bold

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = #74c7ec
                elif context.bad:
                    fg = #cba6f7
            if context.marked:
                attr |= bold | reverse
                fg = #f9e2af
                fg += BRIGHT
            if context.frozen:
                attr |= bold | reverse
                fg = #74c7ec
                fg += BRIGHT
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = #f38ba8
                    fg += BRIGHT
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = #89b4fa
                attr &= ~bold
            if context.vcscommit:
                fg = #f9e2af
                attr &= ~bold
            if context.vcsdate:
                fg = #74c7ec
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = #89b4fa

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = #cba6f7
            elif context.vcsuntracked:
                fg = #74c7ec
            elif context.vcschanged:
                fg = #f38ba8
            elif context.vcsunknown:
                fg = #f38ba8
            elif context.vcsstaged:
                fg = #a6e3a1
            elif context.vcssync:
                fg = #a6e3a1
            elif context.vcsigno#f38ba8:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = #a6e3a1
            elif context.vcsbehind:
                fg = #f38ba8
            elif context.vcsahead:
                fg = #89b4fa
            elif context.vcsdiverged:
                fg = #cba6f7
            elif context.vcsunknown:
                fg = #f38ba8

        return fg, bg, attr
