package com.xxzd.config;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.JedisSentinelPool;
import redis.clients.jedis.JedisShardInfo;
import redis.clients.jedis.ShardedJedis;

@Configuration
@PropertySource("classpath:/properties/redis.properties")
public class RedisConfig {
//	@Value("${redis.host}")
//	private String host;
//	@Value("${redis.port}")
//	private Integer port;
//	//默认为单利 但不够用 修改为多例
//	@Scope("prototype")
//	@Bean
//	public Jedis jedis() {
//		return new Jedis(host,port);
//	}
	
	
	@Scope("prototype")
	@Bean
	public JedisCluster jedisCluster() {
		String[] nodeArr = nodes.split(",");
		HashSet<HostAndPort> nodeSet = new HashSet<HostAndPort>();
		for (String node : nodeArr) {
			String host = node.split(":")[0];
			int port = Integer.parseInt(node.split(":")[1]);
			nodeSet.add(new HostAndPort(host, port));
		}
		JedisCluster jedisCluster = new JedisCluster(nodeSet);
		return jedisCluster;
	}
	
@Value("${redis.nodes}")
private String nodes;  //node,node,node
//	
//	//默认为单利 但不够用 修改为多例
//	@Scope("prototype")
//	@Bean
//	public ShardedJedis shardedJedis() {
//		List<JedisShardInfo> shards = new ArrayList<JedisShardInfo>();
//		String[] redisNodes = nodes.split(",");
//		for (String node : redisNodes) {
//			String[] hostAndPort = node.split(":");
//			String host = hostAndPort[0];
//			int port = Integer.parseInt(hostAndPort[1]);
//			shards.add(new JedisShardInfo(host,port));
//		}
//		return new ShardedJedis(shards);
//	}
//	@Value("${redis.sentinel}")
//	private String node;
//	
//	@Bean
//	public JedisSentinelPool JedisSentinelPool() {
//		HashSet<String> sentinels = new HashSet<>();
//		sentinels.add(node);
//		JedisSentinelPool pool = new JedisSentinelPool("mymaster", sentinels);
//		return pool;
//	}
//	/**
//	 * @Bean注解说明可以帮助实例化对象
//	 * 当实例化对象时 如果有参数 则自动的完成注入
//	 * 也可以这样 @Autowrid JedisSentinelPool
//	 * @param pool
//	 * @return
//	 */
//	
//	@Bean
//	@Scope("prototype")
//	public Jedis jedis(JedisSentinelPool pool) {
//		Jedis jedis = pool.getResource();
//		return jedis;
//	}
}
