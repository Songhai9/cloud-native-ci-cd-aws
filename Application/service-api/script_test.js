import http from 'k6/http';
import { sleep } from 'k6';

export default function() {
  http.get('http://api-load-balancer-300650380.us-east-1.elb.amazonaws.com/');
  sleep(1);
}