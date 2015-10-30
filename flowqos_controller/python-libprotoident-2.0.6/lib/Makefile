CC = gcc
CFLAGS = -c -g -O2 -fPIC
CPP = gcc -E
CPPFLAGS = 
CXX = g++
CXXCPP = g++ -E
CXXFLAGS = -c -g -O2 -fPIC
MAKE = make
LDFLAGS = -shared
PYTHONLOCATION = /usr/include/python2.7
#LOCALHEADERLOCATION = /home/sean/Documents/2013-Fall/8001/libprotoident-2.0.6/lib
LOCALHEADERLOCATION = .

CPPSOURCES = libprotoident.cc proto_common.cc proto_manager.cc \
tcp/lpi_afp.cc tcp/lpi_ftpdata.cc tcp/lpi_kaseya.cc tcp/lpi_nntps.cc tcp/lpi_shoutcast.cc tcp/lpi_viber.cc \
tcp/lpi_akamai.cc tcp/lpi_gamespy.cc tcp/lpi_kaspersky.cc tcp/lpi_nopayload.cc tcp/lpi_sip.cc tcp/lpi_warcraft3.cc \
tcp/lpi_apple_push.cc tcp/lpi_gnutella.cc tcp/lpi_ldap.cc tcp/lpi_notes_rpc.cc tcp/lpi_skype_tcp.cc \
tcp/lpi_web_junk.cc tcp/lpi_ares.cc tcp/lpi_goku.cc tcp/lpi_message4u.cc tcp/lpi_omegle.cc tcp/lpi_smb.cc \
tcp/lpi_weblogic.cc tcp/lpi_bitextend.cc tcp/lpi_hamachi.cc tcp/lpi_mitglieder.cc tcp/lpi_openvpn.cc \
tcp/lpi_smtp.cc tcp/lpi_whois.cc tcp/lpi_bittorrent.cc tcp/lpi_harveys.cc tcp/lpi_mms.cc tcp/lpi_palringo.cc \
tcp/lpi_smtps.cc tcp/lpi_winmx.cc tcp/lpi_blizzard.cc tcp/lpi_http_badport.cc tcp/lpi_mp2p.cc tcp/lpi_paltalk.cc \
tcp/lpi_socks4.cc tcp/lpi_wow.cc tcp/lpi_cgp.cc tcp/lpi_http.cc tcp/lpi_msn.cc tcp/lpi_pando.cc tcp/lpi_socks5.cc \
tcp/lpi_wuala.cc tcp/lpi_chatango.cc tcp/lpi_http_nonstandard.cc tcp/lpi_msnc.cc tcp/lpi_pdbox.cc \
tcp/lpi_spotify.cc tcp/lpi_xmpp.cc tcp/lpi_cisco_vpn.cc tcp/lpi_https.cc tcp/lpi_msnv.cc tcp/lpi_pop3.cc \
tcp/lpi_ssh.cc tcp/lpi_xmpps.cc tcp/lpi_clubbox.cc tcp/lpi_http_tunnel.cc tcp/lpi_munin.cc tcp/lpi_pop3s.cc \
tcp/lpi_ssl.cc tcp/lpi_xunlei.cc tcp/lpi_cod_waw.cc tcp/lpi_ica.cc tcp/lpi_mysql.cc tcp/lpi_postgresql.cc \
tcp/lpi_steam.cc tcp/lpi_xymon.cc tcp/lpi_conquer.cc tcp/lpi_id.cc tcp/lpi_mystery_100_star.cc tcp/lpi_pptp.cc \
tcp/lpi_stun.cc tcp/lpi_yahoo.cc tcp/lpi_cryptic.cc tcp/lpi_imap.cc tcp/lpi_mystery_443.cc tcp/lpi_psn_store.cc \
tcp/lpi_supl.cc tcp/lpi_yahoo_error.cc tcp/lpi_cvs.cc tcp/lpi_imaps.cc tcp/lpi_mystery_8000.cc tcp/lpi_razor.cc \
tcp/lpi_svn.cc tcp/lpi_yahoo_webcam.cc tcp/lpi_directconnect.cc tcp/lpi_imesh.cc tcp/lpi_mystery_9000.cc \
tcp/lpi_rbls.cc tcp/lpi_tds.cc tcp/lpi_youku.cc tcp/lpi_dns.cc tcp/lpi_invalid_bittorrent.cc \
tcp/lpi_mystery_conn.cc tcp/lpi_rdp.cc tcp/lpi_teamviewer.cc tcp/lpi_zabbix.cc tcp/lpi_dvrns.cc \
tcp/lpi_invalid.cc tcp/lpi_mystery_iG.cc tcp/lpi_rejection.cc tcp/lpi_telecomkey.cc tcp/lpi_zynga.cc \
tcp/lpi_dxp.cc tcp/lpi_invalid_http.cc tcp/lpi_mystery_pspr.cc tcp/lpi_rfb.cc tcp/lpi_telnet.cc \
tcp/lpi_ea_games.cc tcp/lpi_invalid_pop.cc tcp/lpi_mystery_rxxf.cc tcp/lpi_rpcscan.cc tcp/lpi_telnet_exploit.cc \
tcp/lpi_emule.cc tcp/lpi_invalid_smtp.cc tcp/lpi_mystery_symantec.cc tcp/lpi_rsync.cc tcp/lpi_tip.cc \
tcp/lpi_eye.cc tcp/lpi_ipop.cc tcp/lpi_mzinga.cc tcp/lpi_rtmp.cc tcp/lpi_tor.cc \
tcp/lpi_flash.cc tcp/lpi_irc.cc tcp/lpi_ncsoft.cc tcp/lpi_rtsp.cc tcp/lpi_trackmania.cc \
tcp/lpi_fring.cc tcp/lpi_java.cc tcp/lpi_netbios.cc tcp/lpi_runescape.cc tcp/lpi_trojan_win32_generic_sb.cc \
tcp/lpi_ftpcontrol.cc tcp/lpi_jedi.cc tcp/lpi_nntp.cc tcp/lpi_second_life.cc tcp/lpi_trojan_zeroaccess.cc \
udp/lpi_akamai.cc udp/lpi_epson.cc udp/lpi_kazaa.cc udp/lpi_newerth.cc udp/lpi_serialnumberd.cc \
udp/lpi_tremulous.cc udp/lpi_akamai_transfer.cc udp/lpi_eso.cc udp/lpi_l2tp.cc udp/lpi_nopayload.cc \
udp/lpi_sip.cc udp/lpi_tvants.cc udp/lpi_amanda.cc udp/lpi_esp_encap.cc udp/lpi_lansync.cc udp/lpi_norton.cc \
udp/lpi_skype.cc udp/lpi_unreal.cc udp/lpi_apple_facetime_init.cc udp/lpi_eye.cc udp/lpi_ldap_ad.cc \
udp/lpi_ntp.cc udp/lpi_slp.cc udp/lpi_ventrilo.cc udp/lpi_ares.cc udp/lpi_fasp.cc udp/lpi_linkproof.cc \
udp/lpi_nwn.cc udp/lpi_snmp.cc udp/lpi_vivox.cc udp/lpi_backweb.cc udp/lpi_fortinet.cc udp/lpi_mdns.cc \
udp/lpi_opaserv.cc udp/lpi_sopcast.cc udp/lpi_vxworks_exploit.cc udp/lpi_battlefield.cc udp/lpi_freechal.cc \
udp/lpi_moh.cc udp/lpi_orbit.cc udp/lpi_spamfighter.cc udp/lpi_winmessage.cc udp/lpi_bjnp.cc udp/lpi_gamespy.cc \
udp/lpi_mp2p.cc udp/lpi_pando.cc udp/lpi_spotify_bcast.cc udp/lpi_worm_22105.cc udp/lpi_checkpoint_rdp.cc \
udp/lpi_garena.cc udp/lpi_msn_cache.cc udp/lpi_pplive.cc udp/lpi_sql_worm.cc udp/lpi_xfire_p2p.cc \
udp/lpi_cirn.cc udp/lpi_gnutella2.cc udp/lpi_msn_video.cc udp/lpi_ppstream.cc udp/lpi_ssdp.cc udp/lpi_xlsp.cc \
udp/lpi_cisco_ipsec.cc udp/lpi_gnutella.cc udp/lpi_msoffice_mac.cc udp/lpi_probable_gnutella.cc \
udp/lpi_starcraft.cc udp/lpi_xunlei.cc udp/lpi_cod.cc udp/lpi_gnutella_weak.cc udp/lpi_mta.cc udp/lpi_psn.cc \
udp/lpi_steam.cc udp/lpi_youdao_dict.cc udp/lpi_dcc.cc udp/lpi_gsm.cc udp/lpi_mystery_05.cc udp/lpi_pyzor.cc \
udp/lpi_steamfriends.cc udp/lpi_youku.cc udp/lpi_demonware.cc udp/lpi_halflife.cc udp/lpi_mystery_0660.cc \
udp/lpi_qq.cc udp/lpi_steam_localbroadcast.cc udp/lpi_zeroaccess_udp.cc udp/lpi_dhcp.cc udp/lpi_hamachi.cc \
udp/lpi_mystery_0d.cc udp/lpi_qqlive.cc udp/lpi_storm_worm.cc udp/lpi_dht_dict.cc udp/lpi_imesh.cc \
udp/lpi_mystery_45.cc udp/lpi_quake.cc udp/lpi_stun.cc udp/lpi_dht_other.cc udp/lpi_ipmsg.cc \
udp/lpi_mystery_61_72.cc udp/lpi_radius.cc udp/lpi_syslog.cc udp/lpi_diablo2.cc udp/lpi_ipv6.cc \
udp/lpi_mystery_8000.cc udp/lpi_real.cc udp/lpi_teamspeak.cc  udp/lpi_directconnect.cc udp/lpi_isakmp.cc \
udp/lpi_mystery_99.cc udp/lpi_roblox.cc udp/lpi_teamviewer.cc udp/lpi_dns.cc udp/lpi_jedi_academy.cc \
udp/lpi_mystery_e9.cc udp/lpi_rtcp.cc udp/lpi_teredo.cc udp/lpi_driveshare.cc udp/lpi_jedi.cc \
udp/lpi_mystery_qq.cc udp/lpi_rtmfp.cc udp/lpi_tftp.cc udp/lpi_emule.cc udp/lpi_kademlia.cc udp/lpi_netbios.cc \
udp/lpi_rtp.cc udp/lpi_thq.cc udp/lpi_emule_weak.cc udp/lpi_kaspersky.cc udp/lpi_netflow.cc \
udp/lpi_second_life.cc udp/lpi_traceroute.cc
CSOURCES = libprotoident_wrap.c


HEADERS=libprotoident.h  proto_common.h proto_manager.h \
tcp/tcp_protocols.h \
udp/udp_protocols.h
INTERFACEFILE = libprotoident.i
LOCALDEPS = $(CPPSOURCES) $(CSOURCES) $(HEADERS) $(INTERFACEFILE)
OBJECTS = $(CPPSOURCES:.cc=.o) $(CSOURCES:.c=.o) 
LIBRARYNAME = _libprotoident.so


all: swig libprotoident python

swig: $(INTERFACEFILE)
	swig -python $(INTERFACEFILE)


libprotoident: swig $(OBJECTS) 
	$(CXX) $(LDFLAGS) $(OBJECTS) -o $(LIBRARYNAME) -L$(PYTHONLOCATION)

.cc.o:
	$(CXX) $(CXXFLAGS) $< -o $@ -I$(PYTHONLOCATION) -I$(LOCALHEADERLOCATION)

.c.o:
	$(CC) $(CFLAGS) $< -o $@ -I$(PYTHONLOCATION) -I$(LOCALHEADERLOCATION)

python:

clean: 
	rm -f *.o *.so *~ core
	rm -f tcp/*.o *~
	rm -f udp/*.o *~
	rm -f libprotoident_wrap.c
	rm -f libprotoident.py
	rm -f libprotoident.pyc

