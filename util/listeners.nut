listeners <- {}


function AddListener(event, listener, order)
{
    local listenerPair = [order, listener];
    if (event in listeners)
    {
        local queue = listeners[event]
        local size = queue.len()
        local i = 0
        for (; i < size; i++)
            if (queue[i][0] > order)
                break
        queue.insert(i, listenerPair)
    }
    else
        listeners[event] <- [listenerPair]
    return listenerPair;
}

function RemoveListener(listenerPair)
{
    if (event in listeners)
        listeners.remove(listenerPair);
}

function FireListeners(event, params)
{
    if (!(event in listeners))
        return;

    foreach (entry in listeners[event])
    {
        try { entry[1].call(this, params) }
        catch(e) {}
    }
}