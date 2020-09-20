FROM nfcore/base:1.10.2

# install main packages:
RUN apt-get update; apt-get clean all;

RUN apt-get install --yes build-essential \
                          gcc-multilib \
                          apt-utils \
			  curl \
                          perl \
			  zip \
                          expat \
                          libexpat-dev
			  
RUN apt-get install --yes cpanminus

RUN apt-get install --yes libxml-libxml-perl \
			  libxml-dom-xpath-perl \
			  libxml-libxml-simple-perl \
			  libxml-dom-perl

RUN cpanm CPAN::Meta Statistics::Lite Bio::TreeIO

# install TargetScan Executables

RUN curl --output ./targetscan_70.zip http://www.targetscan.org/vert_72/vert_72_data_download/targetscan_70.zip

RUN unzip targetscan_70.zip

RUN curl --output ./targetscan_70_BL_PCT.zip http://www.targetscan.org/vert_72/vert_72_data_download/targetscan_70_BL_PCT.zip

RUN unzip targetscan_70_BL_PCT.zip

RUN curl --output ./TargetScan7_context_scores.zip http://www.targetscan.org/vert_72/vert_72_data_download/TargetScan7_context_scores.zip

RUN unzip TargetScan7_context_scores.zip 

RUN mv targetscan_70.pl /usr/bin/

RUN mv TargetScan7_BL_PCT/targetscan_70_BL_bins.pl /usr/bin/

RUN mv TargetScan7_BL_PCT/targetscan_70_BL_PCT.pl /usr/bin/

RUN chmod 777 TargetScan7_context_scores/targetscan_70_context_scores.pl && mv TargetScan7_context_scores/targetscan_70_context_scores.pl /usr/bin/

RUN mv TargetScan7_context_scores/targetscan_count_8mers.pl /usr/bin/

