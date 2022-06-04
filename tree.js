
// https://medium.com/@jamesonbass/stacks-queues-depth-first-search-and-breadth-first-search-90eeafe3f6f4

// https://github.com/arkenidar/lua-nodes/blob/main/tree-of-nodes.jpeg

// https://github.com/arkenidar/lua-nodes

var tree={
     data:1,
     sub:[
          {data:8, sub:[
               {data:6, sub:[
                    {data:10, sub:[]},
                    {data:7, sub:[]}
               ]},
               {data:4, sub:[]},
               {data:3, sub:[]}
          ]},
          {data:5, sub:[]},
          {data:2, sub:[
               {data:9, sub:[]}
          ]}
     ]
}

// tree/BFS
const breadthFirstSearch = rootNode => {
     
     //Set up our queue and array to track visited elements
     
     const queue = [rootNode],
           visitedArray = [];
     
     //Set up a while loop that will run as long as there are 
     //elements in the queue. Once the queue is empty, the loop
     //will break and we will return our visited array
     
     while(queue.length){
          
          //here we set the node variable to the next element
          //in the queue
          
          const node = queue.shift();

          //Any child nodes are being pushed to the end of the
          //queue. Here we are using the spread operator to pull
          //any elements out of the child array

          queue.push(...node.sub);

          //here we are pushing the node into our visited array
          visitedArray.push(node.data);
     }

     //Return our array of visited elements    
     return visitedArray;

} 

// If everything works as it should, we will get an array back
// with the following node order: [1, 8, 5, 2, 6, 4, 3, 9, 10, 7]
console.log( breadthFirstSearch(tree) )
