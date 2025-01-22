import logging
import sys

from  send import send_simple_message
from  templates import send_simple_message_templates

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

logging.info(send_simple_message())
logging.info(send_simple_message_templates())
 
sys.exit(0)